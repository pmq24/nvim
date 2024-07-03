local M = {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = { "Telescope" },
	dependencies = {
		"folke/which-key.nvim",
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
	},
	main = "telescope",
	keys = { "<A-f>", "<A-w>" },
	opts = function()
		return {
			defaults = {
				file_ignore_patterns = {
					"node_modules",
				},
				layout_strategy = "vertical",
				prompt_prefix = "󰌌 ",
				selection_caret = " ",
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				live_grep_args = {
					mappings = {
						i = {
							["<C-a>"] = require("telescope-live-grep-args.actions").quote_prompt(),
						},
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		}
	end,
}

function M.config(spec, opts)
	local telescope = require(spec.main)
	telescope.setup(opts)

	telescope.load_extension("fzf")
	telescope.load_extension("live_grep_args")
	telescope.load_extension("ui-select")

	local telescope_builtins = require("telescope.builtin")
	local wk = require("which-key")

	wk.register({
		["<A-d>"] = {
			"<cmd>Telescope lsp_definitions<CR>",
			"Finding definitions",
		},
		["<A-S-d>"] = {
			"<cmd>Telescope lsp_type_definitions<CR>",
			"Finding type definitions",
		},
		["<A-f>"] = {
			function()
				telescope_builtins.find_files()
			end,
			"Finding files",
		},
		["<A-r>"] = {
			"<cmd>Telescope lsp_references<CR>",
			"Finding references",
		},
		["<A-w>"] = {
			function()
				telescope.extensions.live_grep_args.live_grep_args()
			end,
			"Finding words",
		},
	})
end

return M
