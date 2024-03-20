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
	["<Esc>"] = {
		"<cmd>noh<CR>",
		"Clear highlights",
	},
	["<leader>"] = {
		f = {
			name = "󰍉 Find...",
			a = {
				"<cmd>Telescope buffers<CR>",
				"󱀺 Active buffers",
			},
			f = {
				"<cmd>Telescope find_files<CR>",
				"󰈔 Files",
			},
			w = {
				function()
					require("telescope").extensions.live_grep_args.live_grep_args()
				end,
				"󰇧 Words",
			},
		},
		g = {
			name = "󰜎 Go to...",
			d = {
				function()
					vim.lsp.buf.definition()
				end,
				" Definition",
			},
			r = {
				function()
					vim.lsp.buf.references()
				end,
				" References",
			},
		},
		q = {
			"<cmd>q<CR>",
			"󰅖 Quit Current Buffer",
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
	m = {
		function()
			vim.lsp.buf.code_action()
		end,
		"Code action",
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
