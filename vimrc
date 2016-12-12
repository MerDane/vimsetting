filetype plugin on
filetype indent on
filetype on
syntax on

if has('gui_runing')
	  :colorscheme slate
else
	  :colorscheme industry
endif

let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1 
let g:conda_startup_msg_suppress = 1

set langmenu=en
set fileencoding=utf-8
set encoding=utf-8
set shellslash

set nobackup
set noswapfile
set autoread
set nocompatible

set showcmd
set cmdheight=2
set number
set relativenumber
set showmatch  

set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
hi CursorLineNr term=bold   cterm=NONE ctermfg=228 ctermbg=NONE
:hi Folded term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
:hi FoldColumn guibg=black guifg=LightGrey ctermfg=4 ctermbg=7

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set scrolloff=3
set autoindent
set smartindent
set backspace=eol,start,indent


set showmode
""set iminsert=2
set hidden
set wildmenu
set wildmode=list:longest
set visualbell

set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
set grepprg=grep\ -nH\ $*

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

set title
set undofile
set noerrorbells
set novisualbell
set t_vb=
set tm=500                                                                                              

call plug#begin('$HOME/.vim/plugged')
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'spolu/dwm.vim'
Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'sudar/vim-arduino-syntax'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'cjrh/vim-conda'
Plug 'tell-k/vim-autopep8'
Plug 'scrooloose/nerdcommenter'
call plug#end()

if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
  endif


function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function s:def_runkey()
    if &ft=='python'
        map <F4> :!python %<CR>
    elseif &ft=='tex'
        map <F4> :!latex %<CR>
    endif
endfunction

nnoremap j gj
nnoremap k gk
nmap <Esc><Esc> :nohlsearch<CR><Esc>
map <F2> :NERDTreeToggle<CR>
map <F3> :PymodeLintAuto<CR>
map <F7> :vsplit<CR>
map <F8> :split<CR>
nnoremap <F9> <C-w>w
map <F10> :bufdo tab split<CR>
let NERDTreeMapOpenInTab='<ENTER>'
let g:vim_markdown_no_default_key_mapping = 1 
let g:tex_flavor='latex'
let mapleader = ','
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
autocmd BufRead * call <SID>def_runkey()
