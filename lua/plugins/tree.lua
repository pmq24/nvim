local M = {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	main = "nvim-tree",
	opts = {
		git = {
			enable = false,
			ignore = false,
			timeout = 500,
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

function M.config(spec, opts)
	require(spec.main).setup(opts)

	require("helpers.register_which_key").add({
		{
			"<C-n>",
			function()
				local nvimtree_api = require("nvim-tree.api").tree

				if not nvimtree_api.is_tree_buf() then
					nvimtree_api.focus()
				else
					nvimtree_api.close()
				end
			end,
			desc = "Toggle File Explorer",
		},
	})
end

return M
