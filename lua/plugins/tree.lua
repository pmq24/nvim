local M = {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	opts = {
		git = {
			enable = false,
			ignore = false,
			timeout = 500,
		},
		live_filter = {
			prefix = "󰍉 ",
		},
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 40,
		},
		renderer = {
			full_name = true,
			highlight_opened_files = "all",
			icons = {
				show = {
					file = false,
					folder = false,
				},
			},
			indent_markers = {
				enable = true,
			},
			root_folder_label = false,
			special_files = {},
		},
		update_focused_file = {
			enable = true,
		},
	},
}

return M
