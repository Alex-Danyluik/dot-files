" Name:         orango
" Description:  A dramatic dark orange and gold colorscheme
" Author:       Original author
" Maintainer:   Original maintainer
" Website:      https://github.com/vim/colorschemes
" License:      Same as Vim
" Last Change:  2026 Jul 24

set background=dark

highlight clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'orango'

" Roasted umber surfaces with tangerine, amber, gold, and peach accents.
let s:colors = {
      \ 'none':          'NONE',
      \ 'background':    '#160d08',
      \ 'surface':       '#24160d',
      \ 'surface_alt':   '#382216',
      \ 'border':        '#4d301e',
      \ 'subtle':        '#755038',
      \ 'muted':         '#b0835c',
      \ 'foreground':    '#ead5b5',
      \ 'caret':         '#ff9d4d',
      \ 'green':         '#f08a3c',
      \ 'green_alt':     '#aa9856',
      \ 'bright_green':  '#e7a14a',
      \ 'function':      '#efaa6f',
      \ 'variable':      '#ead5b5',
      \ 'teal':          '#d9903f',
      \ 'cyan':          '#efaa6f',
      \ 'string':        '#e2a65a',
      \ 'orange':        '#f08a3c',
      \ 'yellow':        '#d9903f',
      \ 'red':           '#dc6448',
      \ 'dark_red':      '#8f3e2d',
      \ 'purple':        '#e58b63',
      \ 'diff_add_bg':   '#2b2513',
      \ 'diff_change_bg':'#38260f',
      \ 'diff_delete_bg':'#321712',
      \ }

" Keep Vim's built-in terminal aligned with the Alacritty palette.
let g:terminal_ansi_colors = [
      \ '#24160d', '#dc6448', '#aa9856', '#d9903f',
      \ '#b0835c', '#f08a3c', '#efaa6f', '#ead5b5',
      \ '#755038', '#dc6448', '#aa9856', '#e7a14a',
      \ '#b0835c', '#ff9d4d', '#efaa6f', '#f5e2c2',
      \ ]

function! s:Highlight(group, attributes) abort
    let l:command = ['highlight', a:group]

    for l:key in [
          \ 'guifg',
          \ 'guibg',
          \ 'guisp',
          \ 'gui',
          \ 'ctermfg',
          \ 'ctermbg',
          \ 'cterm',
          \ ]
        if has_key(a:attributes, l:key)
            call add(l:command, l:key . '=' . a:attributes[l:key])
        endif
    endfor

    execute join(l:command, ' ')
endfunction

function! s:Link(from, to) abort
    execute 'highlight! link ' . a:from . ' ' . a:to
endfunction

call s:Highlight('Normal', {
      \ 'guifg': s:colors.foreground,
      \ 'guibg': s:colors.background,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('CursorLine', {
      \ 'guifg': s:colors.none,
      \ 'guibg': s:colors.surface_alt,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Pmenu', {
      \ 'guifg': s:colors.foreground,
      \ 'guibg': s:colors.surface,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('PmenuSel', {
      \ 'guifg': s:colors.foreground,
      \ 'guibg': s:colors.surface_alt,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('PmenuMatch', {
      \ 'guifg': s:colors.bright_green,
      \ 'guibg': s:colors.surface_alt,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('PmenuMatchSel', {
      \ 'guifg': s:colors.bright_green,
      \ 'guibg': s:colors.surface_alt,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('QuickFixLine', {
      \ 'guifg': s:colors.bright_green,
      \ 'guibg': s:colors.surface_alt,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('ColorColumn', {
      \ 'guifg': s:colors.none,
      \ 'guibg': s:colors.border,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Conceal', {
      \ 'guifg': s:colors.muted,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Cursor', {
      \ 'guifg': s:colors.background,
      \ 'guibg': s:colors.caret,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('CursorColumn', {
      \ 'guifg': s:colors.none,
      \ 'guibg': s:colors.surface,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('CursorIM', {
      \ 'guifg': s:colors.background,
      \ 'guibg': s:colors.teal,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('CursorLineNr', {
      \ 'guifg': s:colors.bright_green,
      \ 'guibg': s:colors.surface_alt,
      \ 'gui': 'bold',
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('EndOfBuffer', {
      \ 'guifg': s:colors.subtle,
      \ 'guibg': s:colors.background,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Error', {
      \ 'guifg': s:colors.red,
      \ 'guibg': s:colors.background,
      \ 'gui': 'reverse',
      \ 'cterm': 'reverse',
      \ })

call s:Highlight('ErrorMsg', {
      \ 'guifg': s:colors.red,
      \ 'guibg': s:colors.background,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('FoldColumn', {
      \ 'guifg': s:colors.subtle,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Folded', {
      \ 'guifg': s:colors.muted,
      \ 'guibg': s:colors.surface_alt,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('IncSearch', {
      \ 'guifg': s:colors.background,
      \ 'guibg': s:colors.string,
      \ 'gui': 'bold',
      \ 'cterm': 'bold',
      \ })

call s:Highlight('LineNr', {
      \ 'guifg': s:colors.subtle,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('MatchParen', {
      \ 'guifg': s:colors.background,
      \ 'guibg': s:colors.yellow,
      \ 'gui': 'bold',
      \ 'ctermfg': s:colors.none,
      \ 'ctermbg': s:colors.none,
      \ 'cterm': 'bold',
      \ })

call s:Highlight('ModeMsg', {
      \ 'guifg': s:colors.green,
      \ 'guibg': s:colors.background,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('MoreMsg', {
      \ 'guifg': s:colors.yellow,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('NonText', {
      \ 'guifg': s:colors.subtle,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('PmenuSbar', {
      \ 'guifg': s:colors.none,
      \ 'guibg': s:colors.surface,
      \ 'gui': s:colors.none,
      \ 'ctermfg': s:colors.none,
      \ 'ctermbg': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('PmenuThumb', {
      \ 'guifg': s:colors.none,
      \ 'guibg': s:colors.muted,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Question', {
      \ 'guifg': s:colors.bright_green,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Search', {
      \ 'guifg': s:colors.background,
      \ 'guibg': s:colors.orange,
      \ 'gui': 'bold',
      \ 'cterm': 'bold',
      \ })

call s:Highlight('SignColumn', {
      \ 'guifg': s:colors.subtle,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('SpecialKey', {
      \ 'guifg': s:colors.muted,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('SpellBad', {
      \ 'guifg': s:colors.red,
      \ 'guibg': s:colors.none,
      \ 'guisp': s:colors.dark_red,
      \ 'gui': 'undercurl',
      \ 'cterm': 'underline',
      \ })

call s:Highlight('SpellCap', {
      \ 'guifg': s:colors.green_alt,
      \ 'guibg': s:colors.none,
      \ 'guisp': s:colors.green_alt,
      \ 'gui': 'undercurl',
      \ 'cterm': 'underline',
      \ })

call s:Highlight('SpellLocal', {
      \ 'guifg': s:colors.foreground,
      \ 'guibg': s:colors.none,
      \ 'guisp': s:colors.string,
      \ 'gui': 'undercurl',
      \ 'cterm': 'underline',
      \ })

call s:Highlight('SpellRare', {
      \ 'guifg': s:colors.orange,
      \ 'guibg': s:colors.none,
      \ 'guisp': s:colors.orange,
      \ 'gui': 'undercurl',
      \ 'cterm': 'underline',
      \ })

call s:Highlight('StatusLine', {
      \ 'guifg': s:colors.foreground,
      \ 'guibg': s:colors.border,
      \ 'gui': 'bold',
      \ 'cterm': 'bold',
      \ })

call s:Highlight('StatusLineNC', {
      \ 'guifg': s:colors.subtle,
      \ 'guibg': s:colors.surface,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('StatusLineTerm', {
      \ 'guifg': s:colors.bright_green,
      \ 'guibg': s:colors.border,
      \ 'gui': 'bold',
      \ 'cterm': 'bold',
      \ })

call s:Highlight('StatusLineTermNC', {
      \ 'guifg': s:colors.subtle,
      \ 'guibg': s:colors.surface,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('ToolbarButton', {
      \ 'guifg': s:colors.background,
      \ 'guibg': s:colors.yellow,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('ToolbarLine', {
      \ 'guifg': s:colors.function,
      \ 'guibg': s:colors.surface,
      \ 'gui': s:colors.none,
      \ 'ctermfg': s:colors.none,
      \ 'ctermbg': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('VertSplit', {
      \ 'guifg': s:colors.border,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Visual', {
      \ 'guifg': s:colors.none,
      \ 'guibg': s:colors.surface_alt,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('VisualNOS', {
      \ 'guifg': s:colors.foreground,
      \ 'guibg': s:colors.surface_alt,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('WarningMsg', {
      \ 'guifg': s:colors.orange,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('WildMenu', {
      \ 'guifg': s:colors.background,
      \ 'guibg': s:colors.bright_green,
      \ 'gui': 'bold',
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('debugBreakpoint', {
      \ 'guifg': s:colors.background,
      \ 'guibg': s:colors.red,
      \ 'gui': 'bold',
      \ 'cterm': 'bold',
      \ })

call s:Highlight('debugPC', {
      \ 'guifg': s:colors.background,
      \ 'guibg': s:colors.green,
      \ 'gui': 'bold',
      \ 'cterm': 'bold',
      \ })

call s:Highlight('Directory', {
      \ 'guifg': s:colors.yellow,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Title', {
      \ 'guifg': s:colors.bright_green,
      \ 'guibg': s:colors.none,
      \ 'gui': 'bold',
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Comment', {
      \ 'guifg': s:colors.muted,
      \ 'guibg': s:colors.none,
      \ 'gui': 'italic',
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Constant', {
      \ 'guifg': s:colors.bright_green,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('String', {
      \ 'guifg': s:colors.string,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Number', {
      \ 'guifg': s:colors.orange,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Function', {
      \ 'guifg': s:colors.function,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Identifier', {
      \ 'guifg': s:colors.variable,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Ignore', {
      \ 'guifg': s:colors.subtle,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('PreProc', {
      \ 'guifg': s:colors.function,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Special', {
      \ 'guifg': s:colors.purple,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Statement', {
      \ 'guifg': s:colors.green,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Operator', {
      \ 'guifg': s:colors.muted,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Todo', {
      \ 'guifg': s:colors.background,
      \ 'guibg': s:colors.yellow,
      \ 'gui': 'bold',
      \ 'ctermfg': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Type', {
      \ 'guifg': s:colors.teal,
      \ 'guibg': s:colors.none,
      \ 'gui': 'bold',
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('Underlined', {
      \ 'guifg': s:colors.none,
      \ 'guibg': s:colors.none,
      \ 'gui': 'underline',
      \ 'ctermfg': s:colors.none,
      \ 'ctermbg': s:colors.none,
      \ 'cterm': 'underline',
      \ })

call s:Highlight('Label', {
      \ 'guifg': s:colors.foreground,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('ColorInclude', {
      \ 'guifg': s:colors.green,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('ColorDefine', {
      \ 'guifg': s:colors.function,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('ColorPreCondit', {
      \ 'guifg': s:colors.function,
      \ 'guibg': s:colors.none,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('DiffAdd', {
      \ 'guifg': s:colors.green_alt,
      \ 'guibg': s:colors.diff_add_bg,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('DiffChange', {
      \ 'guifg': s:colors.yellow,
      \ 'guibg': s:colors.diff_change_bg,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('DiffText', {
      \ 'guifg': s:colors.orange,
      \ 'guibg': s:colors.surface_alt,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Highlight('DiffDelete', {
      \ 'guifg': s:colors.red,
      \ 'guibg': s:colors.diff_delete_bg,
      \ 'gui': s:colors.none,
      \ 'cterm': s:colors.none,
      \ })

call s:Link('Character', 'String')
call s:Link('Boolean', 'Number')
call s:Link('Float', 'Number')
call s:Link('Conditional', 'Statement')
call s:Link('Repeat', 'Statement')
call s:Link('Keyword', 'Statement')
call s:Link('Exception', 'Statement')
call s:Link('StorageClass', 'Type')
call s:Link('Structure', 'Type')
call s:Link('Typedef', 'Type')
call s:Link('Delimiter', 'Operator')
call s:Link('SpecialChar', 'Special')
call s:Link('Tag', 'Statement')

delfunction s:Highlight
delfunction s:Link
