-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Telescope
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Telescope fzf
  use { 
	  'nvim-telescope/telescope-fzf-native.nvim', 
	  run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
  -- Dracula theme
  use({
	  'dracula/vim',
	  as = "dracula",
	  config = function()
		  vim.cmd("colorscheme dracula")
	  end
  })
  -- Auto-pairs
  use {
	  "windwp/nvim-autopairs",
	  event = "InsertEnter",
	  config = function()
		  require("nvim-autopairs").setup {}
	  end
  }
  -- Indent lines
  use "lukas-reineke/indent-blankline.nvim"
  -- Nerd commenter
  use({ 
	  'preservim/nerdcommenter',
  })
  -- LSP
  use 'neovim/nvim-lspconfig'
  -- Devicons 
  use 'nvim-tree/nvim-web-devicons'
  -- Polyglot
  use 'sheerun/vim-polyglot'
  -- Git changes
  use 'mhinz/vim-signify'
  -- CoC
  use {
    'neoclide/coc.nvim',
    run = "npm ci"
  }
  -- Airline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  -- vimtex
  use 'lervag/vimtex'
  -- Snippets
  use 'sirver/ultisnips'
  -- Undotree
  use 'mbbill/undotree'
  -- autoformat
  use 'vim-autoformat/vim-autoformat'
  -- CSS colors
  use 'ap/vim-css-color'
  -- Rainbow parentheses
  use 'junegunn/rainbow_parentheses.vim'
  -- Fugitive
  use 'tpope/vim-fugitive'
  -- No distractions 
  use 'junegunn/goyo.vim'
  -- Surround text
  use 'tpope/vim-surround'
  -- Transparent
  use 'xiyaowong/transparent.nvim'
end)
