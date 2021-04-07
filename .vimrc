set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'arzg/vim-plan9'
Plug 'stillwwater/vim-nebula'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'mg979/vim-visual-multi'
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdcommenter'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'airblade/vim-gitgutter'
Plug 'jremmen/vim-ripgrep'
Plug 'pechorin/any-jump.vim'
Plug 'alvan/vim-php-manual'
Plug 'brooth/far.vim'
Plug 'matze/vim-move'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'c9s/helper.vim'
Plug 'c9s/treemenu.vim'
Plug 'c9s/hypergit.vim'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
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
filetype plugin indent on
map <leader>ff <cmd>Telescope find_files<cr>
map <leader>fg <cmd>Telescope live_grep<cr>
map <leader>fb <cmd>Telescope buffers<cr>
map <leader>fh <cmd>Telescope help_tags<cr>
map <leader>g :Goyo<CR>
nmap <leader>tb :TagbarToggle<CR>
map <leader>q :NERDTreeToggle<CR>
map <leader>r :source $HOME/.vimrc<CR>
nmap <leader>mt <plug>(MergetoolToggle)
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
nnoremap <leader>cc :call ToggleCC()<CR>
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "php8"
nnoremap <silent><leader>pd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>
let g:bookmark_sign = '😜'
let b:ale_linters = ['php', 'phpcs']
let b:ale_fixers = ['phpcbf']
let g:dbs = {
            \  'dev': 'mysql://toor:tomte@localhost/klaravik',
            \  'new': 'mysql://toor:tomte@localhost/klaravik_20210325_ab',
            \  'dsw': 'mysql://toor:tomte@localhost/klaravik_20210401_dsw'
            \ }
hi CursorLine gui=underline cterm=underline ctermfg=None guifg=None guibg=None
