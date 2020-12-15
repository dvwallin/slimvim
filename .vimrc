set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'arzg/vim-plan9'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mattsacks/vim-symbol'
Plug 'mg979/vim-visual-multi'
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'ollykel/v-vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
call plug#end()
let mapleader = ","
if !has('gui_running')
	set t_Co=256
endif
set number
set mouse=a
syntax on
set termguicolors
colorscheme plan9
map <leader>f :FZF<CR>
map <leader>s :w<CR>
map <leader>w :SymbolList<CR>
map <leader>q :NERDTreeToggle<CR>
map <leader>r :source /home/dsw/.vimrc<CR>
imap ee <Esc>
let g:lightline = {
			\     'active': {
			\         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
			\         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
			\     }
			\ }
set laststatus=2
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//
