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
	keys = { "<A-d>", "<A-b>", "<A-f>", "<A-w>" },
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
		}
	end,
}

function M.config(spec, opts)
	local telescope = require(spec.main)
	telescope.setup(opts)
	telescope.load_extension("fzf")
	telescope.load_extension("live_grep_args")
	telescope.load_extension("ui-select")

	vim.keymap.set("n", "<A-b>", ":Telescope buffers<CR>", { desc = " Telescope: buffers" })
	vim.keymap.set("n", "<A-c>", ":Telescope resume<CR>", { desc = " Telescope: continue previous search" })
	vim.keymap.set("n", "<A-d>", ":Telescope lsp_definitions<CR>", { desc = " Telescope: definitions" })
	vim.keymap.set("n", "<A-S-d>", ":Telescope lsp_definitions<CR>", { desc = " Telescope: type definitions" })
	vim.keymap.set("n", "<A-f>", ":Telescope find_files<CR>", { desc = " Telescope: files" })
	vim.keymap.set("n", "<A-r>", ":Telescope lsp_references<CR>", { desc = " Telescope: references" })
	vim.keymap.set("n", "<A-w>", function()
		telescope.extensions.live_grep_args.live_grep_args()
	end, { desc = " Telescope: words" })
end

return M
