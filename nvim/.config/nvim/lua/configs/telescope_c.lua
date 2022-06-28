require('telescope').setup{
    defaults = {
      layout_strategy = "flex",
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    file_ignore_patterns = {"./__pycache__/*", 
                            "__pycache__", 
                            "__pycache__/*",
                            "^__pycache__/*",
                            "./*.txt",
                            "./*.csv",
                            "./*.dat",
                            "./*.out",
                            "./*tags",
                          },
    },
  }
