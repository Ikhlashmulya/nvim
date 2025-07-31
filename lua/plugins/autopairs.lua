return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true, -- gunakan tree-sitter untuk deteksi konteks
  },
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)

    -- integrasi dengan nvim-cmp (jika kamu pakai)
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
