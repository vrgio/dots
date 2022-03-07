" Vim Color File
" Name:       colorscheme.vim
" Version:    0.4
" License:    The MIT License (MIT)

" reset previous colours and syntax settings
hi clear
if exists("syntax_on")
  syntax reset
endif

" set colours
set t_Co=256
let g:colors_name = "universi"
highlight Normal guifg=#ffffff guibg=#141414 guisp=#141414
set background=dark

" Colour groups
" Grays
let s:very_dark_gray = {"gui": "#141414", "cterm": "233"}
let s:dark_gray = {"gui": "#424242", "cterm": "240"}
let s:medium_gray = {"gui": "#848688", "cterm": "102"}
let s:light_gray = {"gui": "#dddddd", "cterm": "15"}
let s:white = {"gui": "#ffffff", "cterm": "15"}

" Blues and greens
let s:blue = {"gui": "#0010c4", "cterm": "4"}
let s:medium_blue = {"gui": "#4f58ff", "cterm": "63"}
let s:steel_blue = {"gui": "#6f8697", "cterm": "59"}
let s:soft_blue = {"gui": "#78bae6", "cterm": "74"}
let s:soft_lime = {"gui": "#88dd88", "cterm": "114"}
let s:lime = {"gui": "#6cc7b6", "cterm": "73"}
let s:dark_lime = {"gui": "#00b850", "cterm": "35"}
let s:dark_cyan = {"gui": "#279683", "cterm": "29"}
let s:medium_cyan = {"gui": "#3dbd83", "cterm": "72"}

" Reds, pinks and purples
let s:dark_red = {"gui": "#910000", "cterm": "88"}
let s:dark_magenta = {"gui": "#633163", "cterm": "254"}
let s:medium_purple = {"gui": "#8d4bc2", "cterm": "134"}
let s:light_purple = {"gui": "#b760e9", "cterm": "134"}
let s:strong_pink = {"gui": "#d6175d", "cterm": "161"}
let s:soft_pink = {"gui": "#f057a8", "cterm": "205"}

" Yellows and browns
let s:red_brown = {"gui": "#755757", "cterm": "254"}
let s:orange_brown = {"gui": "#b58070", "cterm": "131"}
let s:bright_orange = {"gui": "#db733b", "cterm": "173"}
let s:strong_yellow = {"gui": "#a7b300", "cterm": "233"}
let s:pale_yellow = {"gui": "#faffad", "cterm": "229"}

function! s:h(group, style)
  execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction
" Visual
call s:h("Visual", {"bg": s:steel_blue})
call s:h("NonText", {"fg": s:steel_blue})

" Common syntax groups
"call s:h("Cursor", {"fg": s:dark_magenta})
call s:h("Comment", {"fg": s:soft_blue})
call s:h("Constant", {"fg": s:pale_yellow})
call s:h("String", {"fg": s:medium_purple})
call s:h("Character", {"fg": s:medium_purple})
call s:h("Number", {"fg": s:strong_pink})
call s:h("Boolean", {"fg": s:medium_blue})
call s:h("Float", {"fg": s:strong_pink})
call s:h("Snumber", {"fg": s:light_purple})
call s:h("Identifier", {"fg": s:strong_pink})
call s:h("Function", {"fg": s:medium_cyan})
call s:h("Statement", {"fg": s:bright_orange})
call s:h("Conditional", {"fg": s:strong_pink})
call s:h("Repeat", {"fg": s:medium_purple})
call s:h("Label", {"fg": s:soft_blue})
call s:h("Operator", {"fg": s:lime})
call s:h("Keyword", {"fg": s:lime})
call s:h("Brackets", {"fg": s:soft_lime})
call s:h("Cbrackets", {"fg": s:soft_pink})
call s:h("Sbrackets", {"fg": s:soft_blue})
call s:h("Bracketscont", {"fg": s:dark_lime})
call s:h("Include", {"fg": s:pale_yellow})
call s:h("Symbol", {"fg": s:soft_lime})
call s:h("Exception", {"fg": s:light_purple})
call s:h("PreProc", {"fg": s:soft_pink})
call s:h("Type", {"fg": s:medium_gray})
call s:h("Special", {"fg": s:dark_red})
call s:h("Error", {"fg": s:dark_red})
call s:h("ErrorMsg", {"fg": s:dark_red})
call s:h("Todo", {"fg": s:very_dark_gray, "bg": s:strong_yellow})

" HTML syntax groups
hi htmlItalic gui=italic cterm=italic
hi htmlBold gui=bold cterm=bold
hi htmlBoldItalic gui=bold,italic cterm=bold,italic

" Markdowm
call s:h("markdownH1", {"fg": s:dark_magenta})
call s:h("markdownH2", {"fg": s:medium_purple})
call s:h("markdownH3", {"fg": s:light_purple})
call s:h("markdownH4", {"fg": s:strong_pink})
call s:h("markdownH5", {"fg": s:soft_pink})
call s:h("markdownH6", {"fg": s:soft_pink})
call s:h("markdownCode", {"fg": s:lime})
