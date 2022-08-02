if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading plug.vim to ~/.config/nvim/autoload/plug.vim"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-syntastic/syntastic'
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
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
call plug#end()

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

syntax on

noremap <space> :noh<cr>

map <leader>rt :!/usr/local/bin/ctags -R --exclude=.git --exclude=build --exclude=log *  <CR>

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
"coc config
"" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <enter> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<ENTER>\<c-r>=coc#on_enter()\<CR>"


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

hi NormalFloat ctermfg=0 ctermbg=white guibg=black
hi Pmenu ctermfg=0 ctermbg=white guibg=black
"end coc

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set number
set nowrap
set smartindent
