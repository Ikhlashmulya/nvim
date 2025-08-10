return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                    -- neo-tree will lazily load itself
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          follow_current_file = {
            enabled = true,                       -- auto fokus ke file yang sedang dibuka
          },
          hijack_netrw_behavior = "open_default", -- ganti netrw
        },
        window = {
          width = 30,
        }
      })
      vim.keymap.set("n", "<leader>e", ":Neotree toggle filesystem reveal<CR>", { silent = true })
      vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>", { silent = true })
      vim.keymap.set("n", "<leader>i", "<C-w>l", { silent = true })
    end
  }
}
