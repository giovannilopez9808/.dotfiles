syntax on
set relativenumber
set ignorecase
set hlsearch 
set noerrorbells
filetype on
set encoding=utf-8
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set regexpengine=1
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set mouse=a
set wrap linebreak
set termguicolors
set laststatus=2
highlight Comment cterm=bold

packloadall

call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'git@github.com:vim-python/python-syntax.git'
Plug 'mbbill/undotree'
Plug 'lervag/vimtex'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sbdchd/neoformat'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
Plug 'alvan/vim-closetag'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

let hour=strftime("%H")
if 8 <= hour && hour < 19
    "colorscheme delek 
    "colorscheme onehalflight
    colorscheme dracula   
    let g:airline_theme='onehalfdark'
else 
    colorscheme dracula   
    let g:dracula_colorterm = 0
endif 



if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_commmand=['.git/','git --git-dir=%s/.git ls-files -oc --exclude-standard']

let mapleader=" "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsise=50
let g:ctrlp_use_caching=0

" vim fugitive
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent>t :below term<CR>
nnoremap <silent><C-Left> :wincmd h<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <silent><C-Right> :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd V<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +20<CR>
nnoremap <silent> <Leader>- :vertical resize -20<CR>
nnoremap <silent>la :VimtexCompile<CR>
nnoremap <silent> <leader>gg :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gd :YcmCompleter GoToDeclaration<CR>
noremap <silent> <leader>gf :YcmCompleter FixIt<CR>
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

let g:ycm_semantic_triggers = {
        \ 'tex'  : ['{']
        \}
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
let g:vimtex_quickfix_enabled = 0
let g:python_highlight_all = 1
let g:ycm_filetype_whitelist = {'cpp' : 1, 'text' : 1
            \}
autocmd BufWrite *.py Neoformat
autocmd BufWritePre *.c,*.cpp,*.h Neoformat
autocmd BufWritePre *.tex Neoformat
autocmd BufNewFile,BufRead *.tex set filetype=tex

