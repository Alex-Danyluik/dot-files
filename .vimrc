set termguicolors
set foldlevel=12
set cursorline
set colorcolumn=80
set foldmethod=syntax
set incsearch
set signcolumn=yes
set hidden
set splitbelow splitright
set ttimeout ttimeoutlen=50

" Use Space as the leader key.
let mapleader = ' '

" Enable syntax highlighting
syntax on
set background=dark
set mouse=a
set ttymouse=sgr
colorscheme orango

" Always show a compact, plugin-free status line.
set laststatus=2
set statusline=
set statusline+=\ %<%f
set statusline+=%h%{&modified?'*':''}%r
set statusline+=%=
" set statusline+=\ %{&fileencoding!=''?&fileencoding:&encoding}
" set statusline+=\ [%{&fileformat}]
set statusline+=\ %l:%c
set statusline+=\ %p%%
set statusline+=\ %y\ 

" Open files with the standalone fzf executable.
function! s:FzfFilesExit(selection, origin, open_command, job, status) abort
    let l:files = filereadable(a:selection) ? readfile(a:selection) : []
    call delete(a:selection)

    if a:status == 0 && !empty(l:files) && win_gotoid(a:origin)
        execute a:open_command . ' ' . fnameescape(l:files[0])
    endif
endfunction

function! s:FzfFiles(open_command) abort
    let l:selection = tempname()
    let l:origin = win_getid()
    let l:command = 'fzf --layout=reverse'
          \ . ' --prompt=' . shellescape('Files> ')
          \ . ' > '
          \ . shellescape(l:selection)

    botright 12new
    let l:terminal = term_start([&shell, &shellcmdflag, l:command], {
          \ 'curwin': 1,
          \ 'term_finish': 'close',
          \ 'term_name': 'fzf files',
          \ 'exit_cb': function('<SID>FzfFilesExit',
          \                     [l:selection, l:origin, a:open_command]),
          \ })

    if l:terminal == 0
        close!
        call delete(l:selection)
        echoerr 'Could not start fzf'
        return
    endif

    setlocal nonumber norelativenumber signcolumn=no
    startinsert
endfunction

function! s:FzfBuffersExit(input, selection, origin, job, status) abort
    let l:choices = filereadable(a:selection) ? readfile(a:selection) : []
    call delete(a:input)
    call delete(a:selection)

    if a:status == 0 && !empty(l:choices) && win_gotoid(a:origin)
        let l:buffer = str2nr(matchstr(l:choices[0], '^\d\+'))
        if bufexists(l:buffer)
            execute 'buffer ' . l:buffer
        endif
    endif
endfunction

function! s:FzfBuffers() abort
    let l:input = tempname()
    let l:selection = tempname()
    let l:origin = win_getid()
    let l:choices = []

    for l:buffer in getbufinfo({'buflisted': 1})
        let l:name = empty(l:buffer.name)
              \ ? '[No Name]'
              \ : fnamemodify(l:buffer.name, ':~:.')
        let l:modified = l:buffer.changed ? '[+] ' : ''
        call add(l:choices, printf("%d\t%s%s",
              \ l:buffer.bufnr, l:modified, l:name))
    endfor

    call writefile(l:choices, l:input)
    let l:command = 'fzf --layout=reverse'
          \ . ' --prompt=' . shellescape('Buffers> ')
          \ . ' --delimiter=' . shellescape('\t')
          \ . ' --with-nth=2..'
          \ . ' < ' . shellescape(l:input)
          \ . ' > ' . shellescape(l:selection)

    botright 12new
    let l:terminal = term_start([&shell, &shellcmdflag, l:command], {
          \ 'curwin': 1,
          \ 'term_finish': 'close',
          \ 'term_name': 'fzf buffers',
          \ 'exit_cb': function('<SID>FzfBuffersExit',
          \                     [l:input, l:selection, l:origin]),
          \ })

    if l:terminal == 0
        close!
        call delete(l:input)
        call delete(l:selection)
        echoerr 'Could not start fzf'
        return
    endif

    setlocal nonumber norelativenumber signcolumn=no
    startinsert
endfunction

" Search project text with ripgrep and fzf.
function! s:FzfRgExit(selection, origin, job, status) abort
    let l:matches = filereadable(a:selection) ? readfile(a:selection) : []
    call delete(a:selection)

    if a:status != 0 || empty(l:matches) || !win_gotoid(a:origin)
        return
    endif

    let l:fields = split(l:matches[0], "\t", 1)
    if len(l:fields) < 4
        echoerr 'Could not read ripgrep result'
        return
    endif

    execute 'edit ' . fnameescape(l:fields[0])
    call cursor(str2nr(l:fields[1]), str2nr(l:fields[2]))
    normal! zz
endfunction

function! s:FzfRg(query) abort
    if !executable('rg')
        echoerr 'ripgrep (rg) is not installed'
        return
    endif
    if !executable('fzf')
        echoerr 'fzf is not installed'
        return
    endif

    let l:selection = tempname()
    let l:origin = win_getid()
    let l:rg = 'rg --column --line-number --no-heading --color=never'
          \ . ' --smart-case --field-match-separator='
          \ . shellescape('\t')
          \ . ' -- '
    let l:source = empty(a:query)
          \ ? 'true'
          \ : l:rg . shellescape(a:query) . ' 2>/dev/null'
    let l:reload = 'change:reload:test -z {q} || '
          \ . l:rg . '{q} 2>/dev/null || true'
    let l:command = l:source
          \ . ' | fzf --disabled --layout=reverse'
          \ . ' --prompt=' . shellescape('Rg> ')
          \ . ' --query=' . shellescape(a:query)
          \ . ' --bind=' . shellescape(l:reload)
          \ . ' > ' . shellescape(l:selection)

    botright 12new
    let l:terminal = term_start([&shell, &shellcmdflag, l:command], {
          \ 'curwin': 1,
          \ 'term_finish': 'close',
          \ 'term_name': 'fzf rg',
          \ 'exit_cb': function('<SID>FzfRgExit',
          \                     [l:selection, l:origin]),
          \ })

    if l:terminal == 0
        close!
        call delete(l:selection)
        echoerr 'Could not start fzf'
        return
    endif

    setlocal nonumber norelativenumber signcolumn=no
    startinsert
endfunction

" Open LazyGit for the repository containing the current file.
function! s:GitRoot() abort
    let l:starts = [expand('%:p:h'), getcwd()]

    for l:start in l:starts
        if empty(l:start) || !isdirectory(l:start)
            continue
        endif

        let l:root = systemlist('git -C ' . shellescape(l:start)
              \ . ' rev-parse --show-toplevel 2>/dev/null')
        if v:shell_error == 0 && !empty(l:root)
            return l:root[0]
        endif
    endfor

    return ''
endfunction

function! s:OpenLazyGit() abort
    if !executable('lazygit')
        echoerr 'lazygit is not installed'
        return
    endif

    let l:root = s:GitRoot()
    if empty(l:root)
        echoerr 'Not inside a Git repository'
        return
    endif

    tabnew
    let l:terminal = term_start(['lazygit', '--path', l:root], {
          \ 'curwin': 1,
          \ 'term_finish': 'close',
          \ 'term_kill': 'term',
          \ 'term_name': 'lazygit ' . fnamemodify(l:root, ':t'),
          \ })

    if l:terminal == 0
        tabclose!
        echoerr 'Could not start lazygit'
        return
    endif

    setlocal nonumber norelativenumber signcolumn=no
    startinsert
endfunction

command! Files call <SID>FzfFiles('edit')
command! Buffers call <SID>FzfBuffers()
command! -nargs=* Rg call <SID>FzfRg(<q-args>)
command! LazyGit call <SID>OpenLazyGit()
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>g :Rg<CR>
nnoremap <silent> <leader>l :LazyGit<CR>

" Buffer navigation.
nnoremap <silent> <leader>n :bnext<CR>
nnoremap <silent> <leader>p :bprevious<CR>
nnoremap <silent> <leader><leader> :buffer #<CR>
nnoremap <silent> <leader>x :bdelete<CR>

" File splits, closing, and navigation.
nnoremap <silent> <leader>s :call <SID>FzfFiles('split')<CR>
nnoremap <silent> <leader>v :call <SID>FzfFiles('vsplit')<CR>
nnoremap <silent> <leader>q :close<CR>
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Convert tab to 4 spaces
set shiftwidth=4 smarttab
set expandtab
set smartindent
set tabstop=8 softtabstop=0
