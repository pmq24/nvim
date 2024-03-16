local M = {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	opts = {
		live_filter = {
			prefix = "󰍉 ",
		},
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 50,
		},
		renderer = {
			indent_markers = {
				enable = true,
			},
		},
	},
}

return M
