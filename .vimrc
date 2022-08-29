" vimrc 9.0

" General
" *************
let $LANG='en'
set langmenu=en
set noexrc
set history=1000
set encoding=utf-8
"
" syntax on :
if !exists("syntax_on")
 syntax on
endif
" highlight matching characters:
set showmatch
" paste with middle-mouse
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
" nocompatible and filetype
set nocompatible
filetype plugin on
filetype indent on

" Indentation, LB
" ****************
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set expandtab
" visual line wrap without newlines
set wrap linebreak
set textwidth=0 wrapmargin=0
set formatoptions=l
" python/rust
autocmd Filetype python setlocal ts=8 sw=4 sts=4
autocmd Filetype rust setlocal ts=4 sw=4 sts=4
" makefile noexpandtab
autocmd FileType make setlocal noexpandtab ts=4 sw=4 sts=4

" scrolling
" ******************
set scrolloff=2

" search
" ******************
set hlsearch
set incsearch
noremap i :set nohlsearch<CR>i
inoremap <ESC> <ESC>:set hlsearch<CR>

" Colourscheme
" ***************
set t_Co=16
set background=dark

" Gui (gVim)
" ***************
if has('gui_running')
  " initial size:
  set lines=32 columns=80
  " don't show path on window title
  set titlestring=%t%(\ %M%)
  " colours
  try
    colorscheme basetpl
  catch
    colorscheme habamax
  endtry
endif

" netrw
" ***************
let g:netrw_banner = 0
let g:netrw_liststyle = 3
" open files in new horizontal window
let g:netrw_browse_split = 1
" 25% width
let g:netrw_winsize = 25

" bkup
" ******************
set noundofile
" keep the ~ backups out of sight
set backupdir^=~/.vim/tmp,~/.tmp,/tmp

" Misc
" ***************
" Syntax highlighting in markdown code blocks
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ["c", "cpp", "css", "java", "javascript", "js=javascript", "json=javascript", "lua", "py=python", "rust"]
