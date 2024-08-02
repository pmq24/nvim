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

	require("helpers.register_which_key").add({
		{
			desc = "Telescope: Buffers",
			"<A-b>",
			function()
				vim.cmd("Telescope buffers")
			end,
		},
		{
			"<A-d>",
			desc = "Telescope: Definitions",
			function()
				vim.cmd("Telescope lsp_definitions")
			end,
		},
		{
			"<A-S-d>",
			desc = "Telescope: Type Definitions",
			function()
				vim.cmd("Telescope lsp_type_definitions")
			end,
		},
		{
			"<A-f>",
			desc = "Telescope: Files",
			function()
				telescope_builtins.find_files()
			end,
		},
		{
			"<A-r>",
			desc = "Telescope: References",
			function()
				vim.cmd("Telescope lsp_references")
			end,
		},
		{
			"<A-w>",
			desc = "Telescope: Grep",
			function()
				telescope.extensions.live_grep_args.live_grep_args()
			end,
		},
	})
end

return M
