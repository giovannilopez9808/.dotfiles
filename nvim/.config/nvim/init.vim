set undodir=~/.config/nvim/undotree
highlight Comment cterm=bold
set tabstop=4 softtabstop=4
filetype plugin indent on
set clipboard=unnamedplus
set encoding=utf-8
set colorcolumn=80
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
set wrap
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
Plug 'ryanoasis/vim-devicons'
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Vim
Plug 'lervag/vimtex'
" Undotre
Plug 'mbbill/undotree'
"
Plug 'vim-autoformat/vim-autoformat'
"
Plug 'ap/vim-css-color'
"
Plug 'christianrondeau/vim-base64'
"
Plug 'junegunn/rainbow_parentheses.vim'
"
Plug 'tpope/vim-fugitive'
"
Plug 'mechatroner/rainbow_csv'
"
call plug#end()

lua require('configs')

colorscheme dracula
" Autocomplete
let g:coc_global_extensions=[
            \'coc-python',
            \'coc-vimtex',
            \]
" Status bar
"let g:lightline = {
      "\ 'colorscheme': 'wombat',
      "\ }
 if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
let g:airline_theme="deus"
let g:airline_powerline_fonts = 1
let g:airline_symbols.linenr = '|'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = '|'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#languageclient#enabled = 1
let g:airline#extensions#coc#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled=0
" Tex settings
let g:vimtex_quickfix_enabled = 0
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \]
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let mapleader=" "
let g:tex_flavor = "latex"
" Autocomplete with a enter
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" Python path
"let g:python3_host_prog="/usr/bin/python3"
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
" Code jump
nmap <silent> gg <Plug>(coc-definition)
inoremap <silent><expr> <C-space> coc#refresh()
" Move through windows
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <silent><C-Left> :wincmd h<CR>
nnoremap <silent><C-Right> :wincmd l<CR>
" Undo
nnoremap <leader>u :UndotreeShow<CR>
" Open and close tree
"map <C-b> :NERDTreeToggle<CR>
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
" Save 
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
" Close
nnoremap <C-q> :wq<CR>
inoremap <C-q> <Esc>:wq<CR>
"Copy and paste
vmap <C-c> "*y 
nmap <C-c> "*Y
nmap <C-v> "*p
"
let g:rainbow#pairs = [['(', ')'], ['[', ']'],['{','}'],]
au VimEnter * RainbowParentheses
"
au BufWrite *.tex :Autoformat
au BufWrite *.py :Autoformat
