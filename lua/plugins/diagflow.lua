local M = {
	"dgagn/diagflow.nvim",
	event = { "BufReadPost" },
	opts = {
		max_width = 30,
		padding_top = 5,
		padding_right = 2,
		placement = "top",
		scope = "line",
		show_signs = true,
	},
}

return M
