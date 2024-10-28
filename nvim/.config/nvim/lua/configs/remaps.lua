vim.g.mapleader = " "
vim.keymap.set(
        "n",
        "<leader>pv",
        vim.cmd.Ex
)
vim.keymap.set(
        "n",
        "<leader>sy",
        ":PackerSync<CR>"
)
vim.keymap.set(
        "n",
        "<leader>s",
        "/"
)
-- Nerd Comment
vim.cmd(
        "nmap ++ <plug>NERDCommenterToggle\
        vmap ++ <plug>NERDCommenterToggle"
)
-- Airline
vim.cmd(
        'if !exists("g:airline_symbols")\
        let g:airline_symbols = {}\
        endif'
)
vim.cmd(
        'let g:airline_theme="deus"\
        let g:airline_powerline_fonts = 1\
        let g:airline_symbols.linenr = "|"\
        let g:airline_symbols.maxlinenr = ""\
        let g:airline_symbols.colnr = "|"'
)
vim.cmd(
        'let g:airline#extensions#whitespace#enabled = 0\
        let g:airline#extensions#languageclient#enabled = 1\
        let g:airline#extensions#coc#enabled = 0\
        let g:airline#extensions#branch#enabled = 1\
        let g:airline#extensions#hunks#enabled=0'
)
-- vimtex
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_ignore_filters = {
        "Underfull",
        "Overfull"
}
vim.g.vimtex_quickfix_enabled = 1
vim.g.vimtex_latexmk_build_dir = "./build"
vim.g.vimtex_view_general_viewer = "okular"
vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
vim.g.vimtex_compiler_progname = "nvr"
vim.g.tex_flavor = "latex"
--maplocalleader = ","\
vim.g.vimtex_compiler_latexmk = {
        aux_dir = "build/",
        out_dir = "",
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        hooks = {},
        options = {
                "-verbose",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode"
        }
}
vim.cmd(
        'nnoremap <silent>la :VimtexCompile<CR>\
        autocmd FileType tex nnoremap <silent> <Enter> :VimtexView<CR>'
)
-- CoC
vim.g.coc_global_extensions = {
        "coc-python",
        "coc-vimtex",
        "coc-markdownlint",
        "coc-json"
}
vim.cmd(
        'nmap <silent> gg <Plug>(coc-definition)'
)
local opts = {
        silent = true,
        noremap = true,
        expr = true,
        replace_keycodes = false
}
vim.g.coc_snippet_next = '<tab>'
vim.keymap.set(
        "i",
        "<C-l>",
        [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
        opts
)
vim.keymap.set(
        "i",
        "<C-space>",
        [[coc#refresh()]],
        opts
)
-- Snippets
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
-- Undotree
vim.cmd(
        "nnoremap <leader>u :UndotreeShow<CR>"
)
-- Movement
vim.cmd(
        "nnoremap <S-Up> :m-2<CR>\
        nnoremap <S-Down> :m+<CR>\
        inoremap <S-Up> <Esc>:m-2<CR>\
        inoremap <S-Down> <Esc>:m+<CR>\
        nnoremap <expr> <Down> (v:count == 0 ? 'gj' : 'j')\
        nnoremap <expr> <Up> (v:count == 0 ? 'gk' : 'k')\
        vnoremap <expr> <Down> (v:count == 0 ? 'gj' : 'j')\
        vnoremap <expr> <Up> (v:count == 0 ? 'gk' : 'k')"
)
-- Save and copy
vim.cmd(
        'nnoremap <C-s> :w<CR>\
        inoremap <C-s> <Esc>:w<CR>\
        nnoremap <C-q> :wq<CR>\
        inoremap <C-q> <Esc>:wq<CR>\
        vmap <C-c> "*y\
        nmap <C-c> "*Y\
        nmap <C-v> "*p'
)
-- Return beam on terminal
vim.cmd(
        "augroup RestoreCursorShapeOnExit\
        autocmd!\
        autocmd VimLeave * set guicursor=a:ver20-blinkwait400-blinkoff400-blinkon400\
        augroup END"
)
-- No highlight
vim.cmd(
        "nnoremap <S-h> :noh<CR>"
)
-- Autoformat
vim.cmd(
        "au BufWrite *.py :Autoformat"
)
vim.cmd(
        "au BufWrite *.tex :Autoformat"
)
