return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" }
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
    })
  end,
}
