
" ===================================
" == Julien D, (neo) vimrc
" ===================================



" ===================================
" == Key mapping

" set leader key
let g:mapleader = "\<Space>"

" convert Python2 print '' into Python3 print('')
" works for single or double quotes
function Python2PrintTo3()
    :g/print "/norm A)
    :g/print/: s/print "/print("/g
    :g/print '/norm A)
    :g/print/: s/print '/print('/g
endfunction

" auto pep8 !
map <leader>pp :Neoformat! python autopep8<CR>
" python2 print into python3
map <leader>23 : call Python2PrintTo3()<CR>

" so long Ex mode!
nnoremap <S-Q> : <Esc>

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
set nomodeline " fix security issue

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

"" set status line intos and colors
"set statusline=%F "file full path
"set statusline+=%= "right side of the status bar
"set statusline+=%y "file type
"set statusline +=\ %c:%l/%L "show column:line/max line

" not sure if we need that, need to check 
set encoding=UTF-8
" Display all matching files when we tab complete

set path+=** " Allow recursive search with the :find command

" auto delete trailing white spaces
autocmd BufWritePre *.py :%s/\s\+$//e

call plug#begin('~/.vim/plugged')
"Plug 'ray-x/aurora'      " for Plug user
"Plug 'gruvbox-community/gruvbox'
Plug 'sbdchd/neoformat' "auto code formatter
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" cool status bar 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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

let g:semshi#error_sign_delay = 2
" let g:deoplete#enable_at_startup = 1
let g:airline_theme='badwolf'
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
