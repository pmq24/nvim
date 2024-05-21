local M = {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	event = "BufReadPost",
	main = "treesitter-context",
	opts = {
		max_lines = 3,
		separator = ".",
	},
}

return M
