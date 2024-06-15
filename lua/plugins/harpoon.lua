local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"folke/which-key.nvim",
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	main = "harpoon",
}

function M.config(spec)
	local harpoon = require(spec.main)
	local wk = require("which-key")

	harpoon.setup()

	wk.register({
		["<A-a>"] = {
			function()
				harpoon:list():add()
			end,
			"Harpoon: Add file",
		},

		["<A-h>"] = {
			function()
				harpoon:list():select(1)
			end,
			"Harpoon: H File",
		},
		["<A-j>"] = {
			function()
				harpoon:list():select(2)
			end,
			"Harpoon: J File",
		},
		["<A-k>"] = {
			function()
				harpoon:list():select(3)
			end,
			"Harpoon: K File",
		},
		["<A-l>"] = {
			function()
				harpoon:list():select(4)
			end,
			"Harpoon: L File",
		},
		["<A-y>"] = {
			function()
				harpoon:list():select(5)
			end,
			"Harpoon: Y File",
		},
		["<A-u>"] = {
			function()
				harpoon:list():select(6)
			end,
			"Harpoon: U File",
		},
		["<A-i>"] = {
			function()
				harpoon:list():select(7)
			end,
			"Harpoon: I File",
		},
		["<A-o>"] = {
			function()
				harpoon:list():select(8)
			end,
			"Harpoon: O File",
		},
		["<A-m>"] = {
			function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			"Harpoon: Menu",
		},
	})
end

return M
