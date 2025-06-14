local M = {
	"echasnovski/mini.surround",
	config = true,
	event = "BufReadPost",
	opts = {
		mappings = {
			add = "<leader>sa",
			delete = "<leader>sd",
			find = "<leader>sf",
			find_left = "<leader>sF",
			highlight = "<leader>sh",
			replace = "<leader>sr",
			update_n_lines = "<leader>sn",
		},
	},
}

return M
