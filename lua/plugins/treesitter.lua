return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		require("nvim-treesitter").install({
			"json",
			"javascript",
			"query",
			"typescript",
			"tsx",
			"php",
			"yaml",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
			"vimdoc",
			"c",
			"dockerfile",
			"gitignore",
			"astro",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"php",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
				"vimdoc",
				"c",
				"dockerfile",
				"astro",
			},
			callback = function()
				vim.treesitter.start()
			end,
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"php",
				"yaml",
				"html",
				"css",
				"markdown",
				"bash",
				"lua",
				"vim",
				"c",
				"astro",
			},
			callback = function()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
