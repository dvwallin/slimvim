" Copyright © 2021 <David Satime Wallin david@dwall.in>
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the “Software”), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
" FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
" IN THE SOFTWARE.

" ----------------------------------------------------------------------------

set nocompatible
call plug#begin('~/.vim/plugged')


" LIST OF PLUGINS
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
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'
Plug 'Shougo/vimproc.vim'
Plug 'robertmeta/nofrils'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()
let mapleader = ","
if !has('gui_running')
    set t_Co=256
endif


" NUMBER CONFIG
set number
set relativenumber
set mouse=a


" COLORS AND SYNTAX CONFIG
syntax on
set cc=80
set termguicolors
colo nofrils-acme
let g:nofrils_heavylinenumbers=0
let g:nofrils_strbackgrounds=0
let g:nofrils_heavycomments=0
hi CursorLine gui=underline cterm=underline ctermfg=None guifg=None guibg=None
hi Search guibg=peru guifg=wheat
"set background=light
"colorscheme envy

" EDITING CONFIG
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
filetype plugin indent on
set autoindent expandtab tabstop=4 shiftwidth=4 smarttab
let g:crystal_auto_format = 1
let g:bookmark_sign = '😜'


" KEYBOARD SHORTCUTS
map <leader>ff <cmd>Telescope find_files<cr>
map <leader>fg <cmd>Telescope live_grep<cr>
map <leader>fb <cmd>Telescope buffers<cr>
map <leader>fh <cmd>Telescope help_tags<cr>
map <leader>yw yiw
map <leader>v viw
map <leader>g :Goyo<CR>
map <leader>id gg=G<CR>
map <leader>q :NERDTreeToggle<CR>
map <leader>r :source $HOME/.vimrc<CR>
nmap <leader>x :exec '!'.getline('.')<CR>
map <leader>c :vert bo new $HOME/.cmds<CR>
nmap <leader>w :TagbarToggle<CR>
inoremap <nowait> <esc> <esc>
inoremap jk <esc>
au BufRead,BufNewFile *.php inoremap <buffer> <leader>d :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <buffer> <leader>d :call PhpDoc()<CR>
nnoremap <silent><leader>pd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>


" PHP CONFIG
let g:syntastic_php_checkers = ['php']
let g:tagbar_phpctags_memory_limit = '512M'
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "php8"
let g:phpfmt_standard = 'PSR2'
let b:ale_linters = ['php', 'phpcs']
let g:ale_php_phpcs_executable='phpcs'
let g:ale_php_php_cs_fixer_executable='php-cs-fixer'
let g:ale_fixers = {'php': ['php-cs-fixer']}


" NEEDED DIRECTORIES
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//


" STATUS LINE
set laststatus=2
let g:lightline = {
            \ 'active': {
            \   'right': [
                \   ['lineinfo'],
                \   ['percent'],
                \   [
                \       'fileformat',
                \       'fileencoding',
                \       'filetype',
                \       'charvaluehex'
                \   ]
            \   ],
            \   'left': [
                \   [
                    \   'coc_info',
                    \   'coc_hints',
                    \   'coc_errors',
                    \   'coc_warnings',
                    \   'coc_ok'
                \   ],
                \   [ 'coc_status']
            \   ]
            \ },
            \ 'component_function': {'percent': 'ScrollStatus'},
            \ 'colorscheme': 'one',
            \ }


" EXTRA CONFIGS THAT ARE LOCAL ONLY
let $SECFILE = $HOME . "/.secvimrc"
if filereadable($SECFILE)
    source $SECFILE
endif
