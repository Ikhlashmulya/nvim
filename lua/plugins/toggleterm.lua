return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      shade_terminals = false
    })
  end,
  keys = {
    { [[<c-\>]] },
  }
}
