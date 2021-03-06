" setup pathogen
filetype off
call pathogen#infect()
filetype plugin indent on

if !exists("g:snips_author_email")
  let g:snips_author_email= "jogihoogi@gmail.com"
endif

" no backward compatability
set nocompatible

set lazyredraw

"automatic syntax detection and highlighting
syntax on

set autochdir

set shortmess+=filmnrxoOtT

set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set history=1000
set nospell

"do backups
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/backup

"background
set background=dark
"color stuff
if has('gui_running')
	colorscheme zenburn
else
	colorscheme jogi
	set t_Co=256
endif

" ui
" font
"set gfn=Source\ Code\ Pro\ 10
"set guifont=Source\ Code\ Pro\ 10
"Source Code Pro for Powerline Ultra-Light 10
set gfn=Source\ Code\ Pro\ for\ Powerline\ Regular\ 9
set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 9

" enable powerline font
let g:airline_powerline_fonts = 1

set tabpagemax=15
set showmode

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
	set statusline+=%{fugitive#statusline()} "  Git Hotness
	set statusline+=\ [%{&ff}/%Y]            " filetype
	set statusline+=\ [%{getcwd()}]          " current dir
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
	set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
endif

set backspace=indent,eol,start "backspace
set linespace=0

" man so fucking slow... wtf?
set relativenumber
set number

function! g:ToggleNuMode()
	if(&rnu == 1)
		set nu
	else
		set rnu
	endif
endfunc

noremap <F2> :call g:ToggleNuMode()<cr>

" disable bracket matching
let loaded_matchparen = 1

"searching / matching
set hlsearch	"highlight search terms
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
"set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
set listchars=tab:>.,trail:▫


"formating
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
"set undofile
set undolevels=1000

"key mappings
let mapleader = ','
nnoremap / /\v\c
vnoremap / /\v\c
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap - :Switch<cr>
nnoremap <silent> <Leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>


"Unite settings
nnoremap <Leader>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>
nnoremap <Leader>f :Unite grep:.<cr>
" CtrlP search
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async', 'sorters', 'sorter_rank')
" replacing unite with ctrl-p
nnoremap <Leader>p :Unite -start-insert -buffer-name=files -winheight=10 file_rec/async<cr>

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


" autosave
inoremap <ESC> <ESC>:w<CR>
au FocusLost * :wa

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <A-j> :bp<CR>
nnoremap <A-k> :bn<CR>

nnoremap \t :FufFile<CR>
nnoremap \b :FufFile<CR>

nnoremap \e :NERDTreeToggle<CR>


nnoremap ; :

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

set guioptions-=m
set guioptions-=T
set guioptions-=r

set noswapfile

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function Html2Char()
    " remember cursor position:
	let s:line = line(".")
	let s:column = col(".")
    " if more than 'report' substitutions have been done, vim 
    " displays it.
    let s:save_report = &report
    set report=99999
    %s/&auml;/ä/
    %s/&ouml;/ö/
    %s/&uuml;/ü/
    %s/&Auml;/Ä/
    %s/&Ouml;/Ö/
    %s/&Uuml;/Ü/
    %s/&szlig;/ß/
    let &report=s:save_report
    unlet s:save_report
    call cursor(s:line,s:column)
    unlet s:line
    unlet s:column
endfunction

function Char2Html()
	let s:line = line(".")
	let s:column = col(".")
    let s:save_report = &report
    set report=99999
    %s/ä/\&auml;/
    %s/ö/\&ouml;/
    %s/ü/\&uuml;/
    %s/Ä/\&Auml;/
    %s/Ö/\&Ouml;/
    %s/Ü/\&Uuml;/
    %s/ß/\&szlig;/
    let &report=s:save_report
    unlet s:save_report
    call cursor(s:line,s:column)
    unlet s:line
    unlet s:column
endfunction

function FUCKTHISSHIT()
endfunction

nmap <leader>l :Align

nmap <M-i> :FufBuffer<CR>

" Bubble single lines
nmap <C-k> ddkP
nmap <C-j> ddp
" Bubble multiple lines
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]

function! UmlautFix ()
	:%s/\%u00c4/\&Auml;/
	:%s/\%u00e4/\&auml;/
	:%s/\%u00dc/\&Uuml;/
	:%s/\%u00fc/\&uuml;/
	:%s/\%u00d6/\&Ouml;/
	:%s/\%u00f6/\&ouml;/
	:%s/\%u00df/\&szlig;/
	:%s/\%u201e/\&bdquo;/
	:%s/\%u201c/\&ldquo;/
endfunction

" those come in handy while you have to work with the Yii framework
nmap <leader>yt aecho Yii::t('translation', '');<ESC>bi
nmap <leader>ytp a<?php echo Yii::t('translation', '');?><ESC>bi
nmap <leader>ytw diwiecho Yii::t('translation', '');<ESC>bp
nmap <leader>ytwp diwi<?php echo Yii::t('translation', '');?><ESC>bp

nmap <leader>yu iYii::app()->user
nmap <leader>yua iYii::app()->user->isAdmin

" angular translate bindings
nmap <leader>at a{{ '##' \| translate }}<ESC>F#a
nmap <leader>atp a{{ '##Placeholder' \| translate }}<ESC>F#a

" omni completion
inoremap <C-Space> <C-x><C-o>

map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" toggle spell checking with either en or us dictionaries
map <leader>s0 :setlocal spell! spelllang=en_us<CR>
map <leader>s9 :setlocal spell! spelllang=de_de<CR>

"quick pairs
imap <leader>' ''<C-o>h
imap <leader>" ""<C-o>h
imap <leader>( ()<C-o>h
imap <leader>[ []<C-o>h
imap <leader>{ {}<C-o>h

" gO to create a new line below cursor in normal mode
nmap g<C-O> o<ESC>k
nmap gO O<ESC>j

" upper or lowercase the current word
nmap g^ gUiW
nmap gv guiW

" map unite to c-l
nnoremap <C-l> :Unite<cr>


set wrap
set linebreak

" use 2 spaces for tabs
set tabstop=2 softtabstop=2 shiftwidth=2
" set expandtab

autocmd BufReadPost * :GuessIndent

" " display indentation guides
" set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
"
" " convert spaces to tabs when reading file
" autocmd! bufreadpost * set noexpandtab | retab! 4
"
" " convert tabs to spaces before writing file
" autocmd! bufwritepre * set expandtab | retab! 4
"
" " convert spaces to tabs after writing file (to show guides again)
" autocmd! bufwritepost * set noexpandtab | retab! 4
"
" xiki
" source /tmp/xiki/etc/vim/xiki.vim
