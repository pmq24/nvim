local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	main = "harpoon",
}

function M.config(spec)
	local harpoon = require(spec.main)

	harpoon.setup()

	require("helpers.register_which_key").add({

		{
			"<A-a>",
			desc = "Harpoon: Add file",
			function()
				harpoon:list():add()
			end,
		},
		{
			"<A-h>",
			desc = "Harpoon: H File",
			function()
				harpoon:list():select(1)
			end,
		},
		{
			"<A-j>",
			desc = "Harpoon: J File",
			function()
				harpoon:list():select(2)
			end,
		},
		{
			"<A-k>",
			desc = "Harpoon: K File",
			function()
				harpoon:list():select(3)
			end,
		},
		{
			"<A-l>",
			desc = "Harpoon: L File",
			function()
				harpoon:list():select(4)
			end,
		},
		{
			"<A-m>",
			desc = "Harpoon: Menu",
			function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
		},
	})
end

return M
