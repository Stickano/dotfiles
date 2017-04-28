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
set wildmenu
set ffs=unix,dos,mac			" Set Unix as standard file type
syntax on						" Syntax Highlighting
filetype plugin indent on		" Allow for file-handling
let mapleader=","				" Change <leader>
set modelines=1					" Check for modeline
colors koehler					" Default Color Theme
set background=dark				" Dark Background

" Save Cursor Position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
" }}}

" Editor Behaviour
"{{{
set mouse=a						" Enable Mouse
set autoread					" Autoread when file is changed from outsite
set expandtab					" Replace tab with 4 spaces
set tabstop=4					
set shiftwidth=4
set softtabstop=4				" Backspace to behave like it's removing tab
set autoindent					" Auto indent
set smartindent					" Smart indent
set backspace=indent,eol,start	" Backspace over everything 
"set lbr							" Line break each 200 character
"set tw=200
set wrap						" Word Wrap
set formatoptions+=1			" Always wrap before 1-letter words
set number						" Line number
set showbreak=+++				" Prefix for wrapped lines
set showmatch					" Show matching brackets
set smarttab					" Tab at beginning according to shiftwidth
set scrolloff=10				" Keep 10 lines when scrolling
set clipboard=unnamedplus		" Default clipboard
set clipboard+=autoselect		" Visual selected text in clipboard
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
set ttimeoutlen=50				" Remove the key latency  
set noswapfile
" }}}

" GUI settings
" {{{
set guioptions-=m				" remove menu bar
set guioptions-=T				" remove toolbar
set guioptions-=r				" remove right-hand scroll bar
set guioptions-=L				" remove left-hand scroll bar
set guifont=EnvyCodeR:14
" }}}

" Additional Settings
" {{{
" Easy way to sudo-save
cmap w!! w !sudo tee % >/dev/null

" General Mapping
vmap <C-c> "+y
vmap <C-x> "+d
vmap <C-v> p
map <C-v> p
imap <C-v> <Esc>pi
imap <C-u> <Esc>:undo<CR>i
imap <C-y> <Esc>:redo<CR>i

" Clear Search Highlights
nnoremap <leader><space> :nohlsearch<CR>

" Open/close folds with space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" }}}

" vim:foldmethod=marker:foldlevel=0
