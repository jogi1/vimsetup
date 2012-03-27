set nocompatible
set nocp

call pathogen#infect()

"automatic syntax detection and highlighting
syntax on

filetype plugin indent on
call pathogen#infect()


"background
set background=dark

set shortmess+=filmnrxoOtT

set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set history=1000
set spell

"do backups
set backup

"color stuff
colorscheme vitamin

" ui
" font
set gfn=BitStream\ Vera\ Sans\Mono\ 14
set tabpagemax=15
set showmode
set cursorline

if has('cmdline_info')
	set ruler
	set rulerformat=%l\ %P\ %n\ %O
	set showcmd
endif

if has('statusline')
	set laststatus=2

	" Broken down into easily includeable segments
	set statusline=%<%f\    " Filename
	set statusline+=%w%h%m%r " Options
	" set statusline+=%{fugitive#statusline()} "  Git Hotness
	set statusline+=\ [%{&ff}/%Y]            " filetype
	set statusline+=\ [%{getcwd()}]          " current dir
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
	"set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
endif

set backspace=indent,eol,start "backspace
set linespace=0
set relativenumber

"searching / matching
set hlsearch	"highlight search terms
set ignorecase	"case insensitive matching
set smartcase	"smart casesensitive searching
set incsearch	"search as typing

"completion
set wildmenu					"show selection
set wildmode=list:longest,full	"full match then longest
set ofu=syntaxcomplete#Complete

"substitution
set gdefault

"folding
set foldenable


"highlight certain chars
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

"formating
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set nowrap

"
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set noerrorbells
set title
set ttyfast
set ruler
set undofile
set undolevels=1000

"key mappings
let mapleader = ','
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"code folding
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>


au FocusLost * :wa

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <A-j> :bp<CR>
nnoremap <A-k> :bn<CR>

nnoremap \t :FufFile<CR>
nnoremap \b :FufFile<CR>

nnoremap ; :

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" set guioptions-=m
" set guioptions-=T
" set guioptions-=r

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nmap <M-i> :FufBuffer<CR>

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

