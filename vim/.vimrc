call plug#begin()

Plug 'tpope/vim-sensible'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'

Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'RyanMillerC/better-vim-tmux-resizer'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

call plug#end()

filetype plugin on

autocmd vimenter * ++nested colorscheme gruvbox
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

nnoremap <SPACE> <Nop>
let mapleader=" "

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" enable mouse scrolling
set mouse=a

let g:ycm_autoclose_preview_window_after_insertion = 1

map <silent> <C-n> :NERDTreeToggle<CR>
