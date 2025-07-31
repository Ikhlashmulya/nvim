return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- LSP Installer
    { "williamboman/mason.nvim",          config = true },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    -- 🔧 Setup Mason
    require("mason").setup()
    local mason_lspconfig = require("mason-lspconfig")

    -- 🚀 Setup LSP
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "bashls",
        "jsonls",
      },
      automatic_installation = true,
      handlers = {
        function(serverName)
          lspconfig[serverName].setup({
            capabilities = capabilities
          })
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  global = { 'vim' }
                }
              }
            }
          })
        end
      }
    })

    -- ⚙️ Setup nvim-cmp
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
      },
    })

    --    local servers = {
    --      "lua_ls",
    --      "ts_ls",
    --      "bashls",
    --      "jsonls",
    --    }
    --
    --    for _, server in ipairs(servers) do
    --      lspconfig[server].setup({
    --        capabilities = capabilities,
    --      })
    --    end


    -- 🧠 Keymaps ketika LSP attach
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end,
    })
  end,
}
