-- SUPPORTED LANGUAGES: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages

local LANGUAGES_TO_INSTALL = {
	"bash",
	"dockerfile",
	"gleam",
	"javascript",
	"json",
	"lua",
	"ruby",
	"typescript",
	"yaml",
}

local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = LANGUAGES_TO_INSTALL,
		hightlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	},
}

return M
