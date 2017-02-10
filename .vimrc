" Use Vim settings rather than Vi
set nocompatible

" Plugin Settings
" {{{
" Pathogen Plugin Manager
execute pathogen#infect()

" Grundo (undo) tree 
nnoremap <F5> :GundoToggle<CR>	

" Open Nerd Three Ctrl+n (plugin)
map <C-n> :NERDTreeToggle<CR>	

" Airline Bar
set laststatus=2
" }}}

" General Setting
" {{{
set whichwrap=b,s,<,>,[,]		" Move next/prev line  
set history=500					" History
set autoread					" Autoread when file is changed from outsite
set wildmenu					" Wildmenu 
set ffs=unix,dos,mac			" Set Unix as standard file type
syntax on						" Syntax Highlighting
filetype plugin indent on		" Allow for file-handling
let mapleader=","				" Change <leader>
set modelines=1					" Check for modeline
colors delek					" Default Color Theme

" Save Cursor Position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
" }}}

" Editor Behaviour
"{{{
set mouse=a						" Enable Mouse
set tabstop=4					" Replace tab with 4 spaces
set softtabstop=4				" Backspace to behave like it's removing tab
set autoindent					" Auto indent
set smartindent					" Smart indent
set backspace=indent,eol,start	" Backspace over everything 
set lbr							" Line break each 500 character
set tw=500
set wrap						" Word Wrap
set formatoptions+=1			" Always wrap before 1-letter words
set background=dark				" Dark Background
set number						" Line number
set showmatch					" Show matching brackets
set cursorline					" Highlight cursorline
set copyindent					" Copy previous autoindenting
set smarttab					" Tab at beginning according to shiftwidth
set scrolloff=4					" Keep 4 lines when scrolling
set clipboard=unnamedplus		" Default clipboard
set lazyredraw					" Only redraw when needed
set foldmethod=marker			" Fold on markers
set foldlevel=0					" Fold by default
set selectmode=key				" Mark with Shift+move
set keymodel=startsel
set incsearch					" Instant word search
set hlsearch					" Highlight search-results
set wrapscan					" Continue search from top when hitting bottom
set ignorecase					" Ignore case when searching
set spelllang=en,da				" Spellcheck languages
" }}}

" Additional Settings
" {{{
" Easy way to sudo-save
cmap w!! w !sudo tee % >/dev/null

" Ctrl z, c, x & v (I'm a sucker for those ez mode bindings!)
vmap <C-c> "+y<Esc>i
vmap <C-x> "+d<Esc>i
map <C-v> pi
imap <C-v> <Esc>pi
imap <C-z> <Esc>pi

" Clear Search Highlights
nnoremap <leader><space> :nohlsearch<CR>

" Open/close folds with space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" }}}

" vim:foldmethod=marker:foldlevel=0
