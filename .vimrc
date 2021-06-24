set nocompatible
call plug#begin('~/.vim/plugged')
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
Plug 'ojroques/vim-scrollstatus'
Plug 'josa42/vim-lightline-coc'
Plug 'ollykel/v-vim'
Plug 'vim-crystal/vim-crystal'
Plug 'kkga/vim-envy'
Plug 'iqxd/vim-mine-sweeping'
Plug 'beanworks/vim-phpfmt'
Plug 'preservim/tagbar'
Plug 'vim-php/tagbar-phpctags.vim'
Plug 'scrooloose/syntastic'
Plug 'sumpygump/php-documentor-vim'
Plug 'WolfgangMehner/bash-support'
Plug 'easymotion/vim-easymotion'
Plug 'justincampbell/vim-eighties'
Plug 'jmckiern/vim-venter'
if has('nvim') || has('patch-8.0.902')
    Plug 'mhinz/vim-signify'
else
    Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
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
colorscheme envy
filetype plugin indent on
map <leader>ff <cmd>Telescope find_files<cr>
map <leader>fg <cmd>Telescope live_grep<cr>
map <leader>fb <cmd>Telescope buffers<cr>
map <leader>fh <cmd>Telescope help_tags<cr>
map <leader>yw yiw
map <leader>y viw
map <leader>v :VenterToggle<CR>
map <leader>g :Goyo<CR>
map <leader>id gg=G<CR>
map <leader>q :NERDTreeToggle<CR>
map <leader>r :source $HOME/.vimrc<CR>
nmap <leader>x :exec '!'.getline('.')<CR>
map <leader>c :vert bo new $HOME/.cmds<CR>
nmap <leader>w :TagbarToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
inoremap <nowait> <esc> <esc>
inoremap jk <esc>
au BufRead,BufNewFile *.php inoremap <buffer> <leader>d :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <buffer> <leader>d :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <buffer> <leader>p :call PhpDocRange()<CR>
let g:syntastic_php_checkers = ['php']
let g:tagbar_phpctags_memory_limit = '512M'
let g:lightline = {'active': {'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]}}
set autoindent expandtab tabstop=4 shiftwidth=4 smarttab
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
let g:venter_width = &columns/8
let g:eighties_enabled = 1
let g:eighties_minimum_width = 100
nnoremap <leader>cc :call ToggleCC()<CR>
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "php8"
let g:phpfmt_standard = 'PSR2'
nnoremap <silent><leader>pd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>
let g:crystal_auto_format = 1
let g:bookmark_sign = '😜'
let b:ale_linters = ['php', 'phpcs']
let g:ale_php_phpcs_executable='phpcs'
let g:ale_php_php_cs_fixer_executable='php-cs-fixer'
let g:ale_fixers = {'php': ['php-cs-fixer']}
let g:pdv_cfg_Author = 'David Satime Wallin <david.wallin@klaravik.se>'
let g:pdv_cfg_ClassTags = ["author"]
hi CursorLine gui=underline cterm=underline ctermfg=None guifg=None guibg=None
let g:lightline = {
            \ 'active': {
            \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype', 'charvaluehex']],
            \   'left': [[  'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'coc_status'  ]]
            \ },
            \ 'component_function': {'percent': 'ScrollStatus'},
            \ 'colorscheme': 'one',
            \ }
hi Search guibg=peru guifg=wheat
let $SECFILE = $HOME . "/.secvimrc"
if filereadable($SECFILE)
    source $SECFILE
endif
