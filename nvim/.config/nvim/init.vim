set undodir=~/.config/nvim/undotree
highlight Comment cterm=bold
set tabstop=4 softtabstop=4
filetype plugin indent on
set clipboard=unnamedplus
set encoding=UTF-8
set colorcolumn=80
set regexpengine=1
set wrap linebreak
set termguicolors
set shiftwidth=4
set laststatus=2
set noerrorbells
set scrolloff=20
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
syntax on
set wrap
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
Plug 'nvim-tree/nvim-web-devicons'
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
Plug 'lervag/vimtex', {'lazy': 'false'}
Plug 'mhinz/neovim-remote'
Plug 'sirver/ultisnips'
" Undotre
Plug 'mbbill/undotree'
" Autoformat
Plug 'vim-autoformat/vim-autoformat'
" Hex colors 
Plug 'ap/vim-css-color'
" Dependency
Plug 'christianrondeau/vim-base64'
" Rainbow parentheses
Plug 'junegunn/rainbow_parentheses.vim'
" 
Plug 'tpope/vim-fugitive'
" Tagbar
Plug 'preservim/tagbar'
"
Plug 'junegunn/goyo.vim'
"
Plug 'tpope/vim-surround'
call plug#end()

lua require('configs')

colorscheme dracula
" Autocomplete
let g:coc_global_extensions=[
            \'coc-python',
            \'coc-vimtex',
            \'coc-json',
            \]
" Status bar
"let g:lightline = {
      "\ 'colorscheme': 'wombat',
      "\ }
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme="deus"
"let g:airline_theme="dracula"
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
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \]
let g:vimtex_latexmk_build_dir = "./build"
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_compiler_progname = "nvr"
let mapleader=" "
let g:tex_flavor = "latex"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:formatdef_latexindent = '"latexindent -"'
let maplocalleader = ","
let g:vimtex_compiler_latexmk = {
        \ 'aux_dir' : 'build/',
        \ 'out_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
" Autocomplete with a enter
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() :"<CR>"
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
inoremap <C-p> <Esc>:Telescope find_files<cr>
nnoremap <C-p> :Telescope find_files<cr>
" Resize windows
nnoremap <silent> <Leader>+ :vertical resize +20<CR>
nnoremap <silent> <Leader>- :vertical resize -20<CR>
" Compile latex files
nnoremap <silent>la :VimtexCompile<CR>
autocmd FileType tex nnoremap <silent> <Enter> :VimtexView<CR>
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
nnoremap <C-b> :TagbarToggle <CR>:wincmd l<CR>
"
let g:rainbow#pairs = [['(', ')'], ['[', ']'],['{','}'],]
au VimEnter * RainbowParentheses
"
au BufWrite *.tex :Autoformat
au BufWrite *.py :Autoformat
" Return beam on terminal
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver20-blinkwait400-blinkoff400-blinkon400
augroup END
" shortcut for far.vim find
nnoremap <C-f>  :Telescope live_grep<cr>
vnoremap <C-f>  :Telescope live_grep<cr>
"
nnoremap <expr> <Down> (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> <Up> (v:count == 0 ? 'gk' : 'k')
vnoremap <expr> <Down> (v:count == 0 ? 'gj' : 'j')
vnoremap <expr> <Up> (v:count == 0 ? 'gk' : 'k')
"
nnoremap <S-h> :noh<CR>
" latex jump to document
"
nmap n nzz 
