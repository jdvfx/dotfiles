
" ===================================
" == Julien D, (neo) vimrc
" ===================================



" ===================================
" == Key mapping

"
" set leader key
let g:mapleader = "\<Space>"

" resize splits with ctrl+arrow keys  
nnoremap <up> : resize +3<cr>
nnoremap <Down> : resize -3<CR>
nnoremap <Left> : vertical resize +3<CR>
nnoremap <Right> : vertical resize -3<CR>

let python_highlight_all = 1

" clipboard copy/paste
vnoremap <C-c> "+y
map <C-v> "+p

" better tabbing
vnoremap < <gv
vnoremap > >gv

" ===================================
" == other
" ===================================
"
set wildmenu

set hidden " keeps buffers in BG
set exrc " load .vim config files when using `neovim .`
syntax on " basic syntax highlighting
set noerrorbells " silent

"make new split appear below or on the right side of current split
set splitbelow splitright

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab " tabs are spaces
set smartindent
set number! relativenumber!  " hybrid line numbers
set numberwidth=4
set nowrap

set ignorecase
set smartcase " case insensitive search until Uppercase is typed

set noswapfile
set nobackup
set undodir=~/.vim/undodir " need to actually create that directory!
set undofile

set nohlsearch " don't highlight when I'm done searching!
set incsearch

set colorcolumn=80

set title " what am I even editing?

set cursorline
hi CursorLine cterm=None

set scrolloff=8 " start scrolling before the start/end of the page


" this is pretty good, just need to check that Ctrl+e is not used by default
map <C-e> :Lex <bar> vertical resize 40 <CR>

" set status line intos and colors
set statusline=%F "file full path
set statusline+=%= "right side of the status bar
set statusline+=%y "file type
set statusline +=\ %c:%l/%L "show column:line/max line

" not sure if we need that, need to check 
set encoding=UTF-8
" Display all matching files when we tab complete

set path+=** " Allow recursive search with the :find command

" auto delete trailing white spaces
autocmd BufWritePre *.py :%s/\s\+$//e

call plug#begin('~/.vim/plugged')
Plug 'ray-x/aurora'      " for Plug user
"Plug 'gruvbox-community/gruvbox'
"Plug 'sbdchd/neoformat' "auto code formatter
" cool status bar 
Plug 'vim-airline/vim-airline'
"Plug 'davidhalter/jedi-vim'
"
" comment ON/OFF with leader+cc/cu
Plug 'scrooloose/nerdcommenter'
" auto add brackets and quotes white typing
Plug 'jiangmiao/auto-pairs'  
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'junegunn/goyo.vim'
call plug#end()


let g:deoplete#enable_at_startup = 1

" use: PluginInstall to install plugins
"set nocompatible
"filetype off
"set rtp+=~/.config/nvim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'ray-x/aurora'      " for Plug user
"call vundle#end()
"filetype plugin indent on

" set color scheme and custom colors
source ~/.config/nvim/colors.vim
