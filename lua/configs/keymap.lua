vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>/", vim.cmd.nohlsearch)

vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>")

vim.keymap.set("n", "<leader>q", vim.cmd.bd)
