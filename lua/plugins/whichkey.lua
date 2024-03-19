local KEY_MAPPINGS = {
	["<C-n>"] = {
		function()
			local nvimtree_api = require("nvim-tree.api").tree

			if not nvimtree_api.is_tree_buf() then
				nvimtree_api.focus()
			else
				nvimtree_api.close()
			end
		end,
		"Toggle File Explorer",
	},
	["<C-s>"] = {
		function()
			vim.cmd("w!")
		end,
		"Save",
	},
	["<leader>"] = {
		W = {
			function()
				require("telescope").extensions.live_grep_args.live_grep_args()
			end,
			"󱎸 Find Words (Advanced)",
		},
		d = {
			"<cmd>Trouble<CR>",
			"󰓙 Diagnostics",
		},
		f = {
			"<cmd>Telescope find_files<CR>",
			"󰱼 Find Files",
		},
		q = {
			"<cmd>q<CR>",
			"󰅖 Quit Current Buffer",
		},
		w = {
			"<cmd>Telescope live_grep<CR>",
			"󱎸 Find Words",
		},
	},
	F = {
		"<Plug>(leap-backward)",
		"Leap backward",
	},
	K = {
		function()
			vim.lsp.buf.hover()
		end,
		"Hover",
	},
	f = {
		"<Plug>(leap-forward)",
		"Leap forward",
	},
}

local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		icons = {
			breadcrumb = "",
			group = " ",
			separator = "",
		},
	},
}

function M.config(_, opts)
	local wk = require("which-key")
	wk.setup(opts)
	wk.register(KEY_MAPPINGS)
end

function M.init()
	vim.o.timeout = true
	vim.o.timeoutlen = 500
end

return M
