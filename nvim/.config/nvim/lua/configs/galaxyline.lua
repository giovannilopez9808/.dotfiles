use({
  'glepnir/galaxyline.nvim',
  branch = 'main',
  -- your statusline
  config = function()
    require('my_statusline')
  end,
  -- some optional icons
  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
})
