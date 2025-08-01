return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
        separator_style = "thin",
      },
      -- nord colorscheme
      highlights = require("nord.plugins.bufferline").akinsho(),
    })
  end
}
