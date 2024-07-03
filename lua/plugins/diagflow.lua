local M = {
	"dgagn/diagflow.nvim",
	event = { "BufReadPost" },
	main = "diagflow",
	opts = {
		max_width = 60,
		padding_top = 5,
		padding_right = 2,
		placement = "top",
		scope = "line",
		show_signs = true,
	},
}

return M
