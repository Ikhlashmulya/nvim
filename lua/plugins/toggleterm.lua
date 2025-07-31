return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      shade_terminals = false,
    })

    -- nord colorscheme
    require("toggleterm").setup(
      require("nord.plugins.toggleterm").make_opts({
        -- your custom options
      })
    )
  end,
  keys = {
    { [[<c-\>]] },
  }
}
