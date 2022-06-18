set undodir=~/.config/nvim/undotree
highlight Comment cterm=bold
set tabstop=4 softtabstop=4
filetype plugin indent on
set clipboard=unnamed
set encoding=utf-8
set regexpengine=1
set wrap linebreak
set termguicolors
set shiftwidth=4
set laststatus=2
set noerrorbells
set smartindent
set ignorecase
set noswapfile
set incsearch
set expandtab
set smartcase
set hlsearch 
set undofile
set nobackup
filetype on
set mouse=a
set nowrap
syntax on
set nu

call plug#begin('~/.config/nvim/plugged')
" Auto close
Plug 'jiangmiao/auto-pairs'
" Theme
Plug 'dracula/vim'
" Inden lines
Plug 'Yggdroot/indentLine'
" Commenter
Plug 'preservim/nerdcommenter'
" LSP
Plug 'neovim/nvim-lspconfig'
" Icons
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" Tree 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Syntax
Plug 'sheerun/vim-polyglot'
" Change on lines
Plug 'mhinz/vim-signify'
" Transparent
Plug 'tribela/vim-transparent'
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
" Status bar
Plug 'itchyny/lightline.vim'
" Vim
Plug 'lervag/vimtex'
" Undotre
Plug 'mbbill/undotree'
"
Plug 'vim-autoformat/vim-autoformat'
call plug#end()

lua require('configs')

colorscheme dracula
" Autocomplete
let g:coc_global_extensions=[
            \'coc-python',
            \'coc-vimtex',
            \]
" Status bar
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Tex settings
let g:vimtex_quickfix_enabled = 0
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \]

let mapleader=" "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsise=50


" Python path
"let g:python3_host_prog="/usr/bin/python3"

" Code jump
nmap <silent> gg <Plug>(coc-definition)
" Move through windows
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <silent><C-Left> :wincmd h<CR>
nnoremap <silent><C-Right> :wincmd l<CR>
" Undo
nnoremap <leader>u :UndotreeShow<CR>
" Open and close tree
map <C-b> :NERDTreeToggle<CR>
" Comment lines
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
" Open find files
nnoremap <C-p> :Telescope find_files<CR> 
" Resize windows
nnoremap <silent> <Leader>+ :vertical resize +20<CR>
nnoremap <silent> <Leader>- :vertical resize -20<CR>
" Compile latex files
nnoremap <silent>la :VimtexCompile<CR>
" Move lines
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
" Copy and paste
vmap <C-c> "*y 
nmap <C-c> "*Y
nmap <C-v> "*p 
au BufWrite *.tex :Autoformat
au BufWrite *.py :Autoformat

nnoremap <leader>ff :lua require"finders".fd()<cr>
