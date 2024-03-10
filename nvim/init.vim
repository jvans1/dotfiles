if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading plug.vim to ~/.config/nvim/autoload/plug.vim"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-syntastic/syntastic'
Plug 'neovimhaskell/haskell-vim'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree' 
Plug 'tpope/vim-fugitive'
Plug 'yegappan/mru'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
call plug#end()

syntax on
filetype plugin indent on
filetype on
" File tree browser
map \ :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \| :NERDTreeFind<CR>


" move items in quickfix
noremap ]q :cn<CR>
noremap [q :cp<CR>

let mapleader=","
noremap <leader>s :%s/
noremap <leader>f :FZF<ENTER>
noremap <leader>aa "zyiw:exe " Ag --ignore=tags ".@z."" <CR>
noremap <leader>w yiw
noremap <leader>p viwp
noremap <leader>m :Mru<ENTER>

" Go plugins
nmap <leader>b :GoTestFunc<CR>


noremap <space> :noh<cr>

map <leader>rt :!/usr/local/bin/ctags -R --exclude=.git --exclude=build --exclude=log *  <CR>
"haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--max-line-length=160'


noremap [q :lnext<ENTER>
noremap ]q :lprevious<ENTER>
"end syntastic
"
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set number
set nowrap
set smartindent

