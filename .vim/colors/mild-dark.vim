" Name:         mild-dark
" Description:  Colorscheme inspired from tsoding
" Author:       Original author 
" Maintainer:   Original maintainer
" Website:      https://github.com/vim/colorschemes
" License:      Same as Vim
" Last Change:  2024 Aug 15

set background=dark

hi clear
let g:colors_name = 'mild-dark'

hi Normal guifg=#ffffff guibg=#101010 gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#303030 gui=NONE cterm=NONE
hi Pmenu guifg=#ffffff guibg=#101010 gui=NONE cterm=NONE
hi PmenuSel guifg=#ffffff guibg=#303030 gui=NONE cterm=NONE
hi PmenuMatch guifg=#55ff55 guibg=#303030 gui=NONE cterm=NONE
hi PmenuMatchSel guifg=#55ff55 guibg=#303030 gui=NONE cterm=NONE
hi QuickFixLine guifg=#55ff55 guibg=#303030 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#181818 gui=NONE cterm=NONE
hi Conceal guifg=#55ff55 guibg=NONE gui=NONE cterm=NONE
hi Cursor guifg=#ffffff guibg=#55ff55 gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#101010 gui=NONE cterm=NONE
hi CursorIM guifg=#ffffff guibg=#55ff55 gui=NONE cterm=NONE
hi CursorLineNr guifg=#303030 guibg=#55ff55 gui=bold cterm=NONE
hi EndOfBuffer guifg=#303030 guibg=#101010 gui=NONE cterm=NONE
hi Error guifg=#ff5533 guibg=#101010 gui=reverse cterm=reverse
hi ErrorMsg guifg=#ff5533 guibg=#101010 gui=NONE cterm=NONE
hi FoldColumn guifg=#303030 guibg=NONE gui=NONE cterm=NONE
hi Folded guifg=#aaaaaa guibg=#303030 gui=NONE cterm=NONE
hi IncSearch guifg=#aaff88 guibg=#101010 gui=standout cterm=reverse
hi LineNr guifg=#303030 guibg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#ffffff guibg=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
hi ModeMsg guifg=#55ff55 guibg=#101010 gui=NONE cterm=NONE
hi MoreMsg guifg=#55ff55 guibg=NONE gui=NONE cterm=NONE
hi NonText guifg=#303030 guibg=NONE gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#ffffff gui=NONE cterm=NONE
hi Question guifg=#55ff55 guibg=NONE gui=NONE cterm=NONE
hi Search guifg=#55ff55 guibg=#101010 gui=reverse cterm=reverse
hi SignColumn guifg=#303030 guibg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#55ff55 guibg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=#ff5533 guibg=NONE guisp=#d70000 gui=undercurl cterm=underline
hi SpellCap guifg=#55ff55 guibg=NONE guisp=#55ff55 gui=undercurl cterm=underline
hi SpellLocal guifg=#ffffff guibg=NONE guisp=#ffffff gui=undercurl cterm=underline
hi SpellRare guifg=#d787d7 guibg=NONE guisp=#d787d7 gui=undercurl cterm=underline
hi StatusLine guifg=#666666 guibg=#101010 gui=NONE cterm=NONE
hi StatusLineNC guifg=#303030 guibg=#101010 gui=NONE cterm=NONE
hi ToolbarButton guifg=#666666 guibg=#101010 gui=NONE cterm=NONE
hi ToolbarLine guifg=#666666 guibg=#101010 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi VertSplit guifg=#303030 guibg=NONE gui=NONE cterm=NONE
hi Visual guifg=NONE guibg=#303030 gui=NONE cterm=NONE
hi VisualNOS guifg=#ffffff guibg=#303030 gui=NONE cterm=NONE
hi WarningMsg guifg=#ffaa33 guibg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#55ff55 guibg=#101010 gui=NONE cterm=NONE
hi debugBreakpoint guifg=#303030 guibg=#101010 gui=reverse cterm=reverse
hi debugPC guifg=#55ff55 guibg=#101010 gui=reverse cterm=reverse
hi Directory guifg=#55ff55 guibg=NONE gui=NONE cterm=NONE
hi Title guifg=#55ff55 guibg=NONE gui=NONE cterm=NONE
hi Comment guifg=#555555 guibg=NONE gui=bold cterm=NONE
hi Constant guifg=#cccccc guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi Ignore guifg=#303030 guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi Special guifg=#55ff55 guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#55ff55 guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=#ff5533 guibg=#303030 gui=NONE ctermfg=NONE cterm=NONE
hi Type guifg=#55ff55 guibg=NONE gui=bold cterm=NONE
hi Underlined guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi Label guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi ColorInclude guifg=#55ff55 guibg=NONE gui=NONE cterm=NONE
hi ColorDefine guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi ColorPreCondit guifg=#ffffff guibg=NONE gui=NONE cterm=NONE

hi! link Terminal Normal
hi! link Debug Special
hi! link Added String
hi! link Removed WarningMsg
hi! link diffOnly WarningMsg
hi! link diffNoEOL WarningMsg
hi! link diffIsA WarningMsg
hi! link diffIdentical WarningMsg
hi! link diffDiffer WarningMsg
hi! link diffCommon WarningMsg
hi! link diffBDiffer WarningMsg
hi! link lCursor Cursor
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link CurSearch Search
hi! link CursorLineNr CursorLine
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link TabLine StatusLineNC
hi! link TabLineFill StatusLineNC
hi! link TabLineSel StatusLine
hi! link Boolean Constant
hi! link Character Constant
hi! link Conditional Statement
hi! link Define ColorDefine
hi! link Delimiter Statement
hi! link Exception Statement
hi! link Float Constant
hi! link Function Identifier
hi! link Include ColorInclude
hi! link Keyword Type
hi! link Macro Statement
hi! link Number Constant
hi! link Operator Type
hi! link PreCondit ColorPreCondit
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StorageClass Type
hi! link String Constant
hi! link Structure Type
hi! link Tag Special
hi! link Typedef Type
hi! link Terminal Normal
hi! link MessageWindow Pmenu
hi! link PopupNotification Todo
hi DiffAdd guifg=#55ff55 guibg=#303030 gui=NONE cterm=NONE
hi DiffChange guifg=#ffaa33 guibg=#303030 gui=NONE cterm=NONE
hi DiffText guifg=#55ff55 guibg=#303030 gui=NONE cterm=NONE
hi DiffDelete guifg=#ff5533 guibg=#303030 gui=NONE cterm=NONE
