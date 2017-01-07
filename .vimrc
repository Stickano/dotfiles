" Pathogen (plugin manager) -----------------------------------------------------------------
execute pathogen#infect()
syntax on
filetype plugin indent on


" Mouse Settings ----------------------------------------------------------------------------
" Enable Mouse
set mouse=a

" Hide the mouse when typing
set mousehide  


" Navigation Settings -----------------------------------------------------------------------
" Next/Previous line when using arrow-keys at end/start line
set whichwrap=b,s,<,>,[,]


" Spell Checking ----------------------------------------------------------------------------
" Spellcheck languages
set spelllang=en,da


" Cursor Settings ---------------------------------------------------------------------------
" Save Cursor Position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Highlight cursorline
set cursorline

" Always show current position 
set ruler


" Search Settings ---------------------------------------------------------------------------
" Instant word search
set incsearch
set ignorecase

" Highlight search-results
set hlsearch

" Continue search from top when hitting bottom
set wrapscan


" General Settings --------------------------------------------------------------------------
" Indent spaces
set shiftwidth=4

" Smart indent
"set autoindent smartindent 

" History
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Autoread when file is changed from outsite
set autoread

" Wildmenu (auto complete in command) 
set wildmenu

" Command bar height
set cmdheight=2

" Backspace behaviour
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show matching brackets
set showmatch

" Set Unix as standard file type
set ffs=unix,dos,mac

" Change <Leader> to 
let mapleader = ","


" Theming -----------------------------------------------------------------------------------
" Dark Background
set background=dark


" Key mappings ------------------------------------------------------------------------------
" Grundo (undo) tree
nnoremap <F5> :GundoToggle<CR>

" Forgot sudo?
cmap w!! w !sudo tee % >/dev/null

" Ctrl z, c & b 
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
map <C-v> pi
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui

" Shift+Arrow Selection
nmap <S-Up> V<Up>
nmap <S-Down> V<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>V<Up>
imap <S-Down> <Esc>V<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

" Ctrl+Backspace delete previous word
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
