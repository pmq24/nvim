local KEY_MAPPINGS = {
	["<A-C-S-q>"] = {
		"<cmd>wqa!<CR>",
		"Save all files and quit Neovim",
	},
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
	t = {
		name = "  Telescope",
		b = {
			"<cmd>Telescope buffers<CR>",
			"󱁻  Buffers",
		},
		c = {
			function()
				require("telescope.builtin").colorscheme()
			end,
			"  Colorschemes",
		},
		d = {
			"<cmd>Telescope lsp_definitions<CR>",
			"Definitions",
		},
		f = {
			"<cmd>Telescope find_files<CR>",
			"󰈔  Files",
		},
		r = {
			"<cmd>Telescope lsp_references<CR>",
			"References",
		},
		w = {
			function()
				require("telescope").extensions.live_grep_args.live_grep_args()
			end,
			"󰬴  Words",
		},
	},
	["<leader>"] = {
		d = {
			function()
				vim.diagnostic.setloclist()
			end,
			" Diagnostics",
		},
		g = {
			name = "Git",
			b = {
				"<cmd>Gitsign blame_line<CR>",
				"Blame line",
			},
		},
		q = {
			function()
				local current_buffer_is_a_file = vim.bo.buftype == ""

				if current_buffer_is_a_file then
					vim.cmd("write")
				end
				vim.cmd("bdelete")
			end,
			"󰅖 Quit the current buffer",
		},
		v = {
			name = "Open view...",
			g = {
				"<cmd>LazyGit<cr>",
				"Git (LazyGit)",
			},
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
			require("actions-preview").code_actions()
		end,
		"Code action",
	},
}

local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	main = "which-key",
	opts = {
		icons = {
			breadcrumb = "",
			group = " ",
			separator = "",
		},
	},
}

function M.config(spec, opts)
	local wk = require(spec.main)
	wk.setup(opts)
	wk.register(KEY_MAPPINGS)
end

function M.init()
	vim.o.timeout = true
	vim.o.timeoutlen = 500
end

return M
