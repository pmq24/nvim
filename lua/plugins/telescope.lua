local M = {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = { "Telescope" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
	},
}

function M.config()
	telescope = require("telescope")
	telescope.setup({
		defaults = {
			layout_strategy = "vertical",
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	})

	telescope.load_extension("live_grep_args")
	telescope.load_extension("fzf")
end

return M
