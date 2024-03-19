local M = {
	"petertriho/nvim-scrollbar",
	dependencies = {
		"kevinhwang91/nvim-hlslens",
		"lewis6991/gitsigns.nvim",
	},
	event = { "BufReadPost" },
	main = "scrollbar",
	opts = {},
}

return M
