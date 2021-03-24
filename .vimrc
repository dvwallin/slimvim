set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'arzg/vim-plan9'
Plug 'stillwwater/vim-nebula'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mg979/vim-visual-multi'
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdcommenter'
Plug 'ackyshake/VimCompletesMe'
Plug 'ludovicchabant/vim-gutentags'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/tagbar'
Plug 'jremmen/vim-ripgrep'
Plug 'pechorin/any-jump.vim'
Plug 'wellle/context.vim'
Plug 'alvan/vim-php-manual'
call plug#end()
let mapleader = ","
if !has('gui_running')
	set t_Co=256
endif
set number
set relativenumber
set mouse=a
syntax on
set termguicolors
set background=light
colorscheme nebula
filetype plugin on
map <leader>f :FZF<CR>
map <leader>s :w<CR>
map <leader>g :Goyo<CR>
nmap <leader>w :TagbarToggle<CR>
map <leader>q :NERDTreeToggle<CR>
map <leader>r :source $HOME/.vimrc<CR>
let g:lightline = {'active': {'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]}}
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set laststatus=2
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//
set cc=80
fun! ToggleCC()
  if &cc == ''
    set cc=80
  else
    set cc=
  endif
endfun
nnoremap <leader>l :call ToggleCC()<CR>
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "php8"
nnoremap <silent><leader>pd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>
let g:bookmark_sign = '😜'
let b:ale_linters = ['php', 'phpcs']
let b:ale_fixers = ['phpcbf']
