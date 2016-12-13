" Automatic reload of .vimrc
autocmd! bufwritepost .vimrc source %

filetype plugin on
filetype indent on
filetype on
syntax on

" leader key to ','
let mapleader = ','

" map sort function to <leader>s
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" Detect the vim or Gvim
if has('gui_runing')
  :colorscheme slate
else
  :colorscheme industry
endif

let g:airline_theme='hybrid'
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
set hidden
set wildmenu
set wildmode=list:longest

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
"-------------------Package Area------------------
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
Plug 'tell-k/vim-autopep8'
Plug 'scrooloose/nerdcommenter'
Plug 'Lokaltog/vim-powerline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()
"-------------------Package Setting----------------
" " -------------pymode setting-----------------
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_rope_complete_on_dot = 1
"let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_lint_unmodified = 0
let g:pymode_syntax = 1
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>rr'
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_syntax_all =1
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_string_templates = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" "--------------Jedi-----------------------
let g:jedi#completions_command = "<C-N>"
let g:jedi#popup_on_dot = 0
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_select_first = 0

" "-----------------------Ominicomplete--------------------
" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
	if pumvisible()
		if a:action == 'j'
			return "\<C-N>"
		elseif a:action == 'k'
			return "\<C-P>"
		endif
	endif
	return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" "-------------NERDcommenter setting--------
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
" ---------------ctrlp setting----------------
" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

"-------------------Some defined function-------------------
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
        map <F5> :!python %<CR>
    elseif &ft=='tex'
        map <F5> :!latex %<CR>
    endif
endfunction

nnoremap j gj
nnoremap k gk
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h
" easier moving between tabs
map <Leader>n <ESC>:tabprevious<CR>
map <Leader>m <ESC>:tabnext<CR>
nmap <ESC><ESC> :nohlsearch<CR><ESC>
map <F3> :NERDTreeToggle<CR>
map <F4> :PymodeLintAuto<CR>
map <F7> :vsplit<CR>
map <F8> :split<CR>
map <F9> :bufdo tab split<CR>
let nerdtreemapopenintab='<enter>'
let g:vim_markdown_no_default_key_mapping = 1 
let g:tex_flavor='latex'
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

autocmd bufread * call <sid>def_runkey()
