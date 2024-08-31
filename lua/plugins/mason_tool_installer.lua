local M = {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	build = ":MasonToolsInstall",
	dependencies = {
		"williamboman/mason.nvim",
	},
	main = "mason-tool-installer",
	lazy = false,
	opts = {
		ensure_installed = {
			"dockerfile-language-server",
			"erb-formatter",
			"eslint-lsp",
			"gopls",
			"json-lsp",
			"html-lsp",
			"lua-language-server",
			"prettier",
			"stylua",
			"tailwindcss-language-server",
			"typescript-language-server",
			"rubocop",
			"yaml-language-server",
		},
		log_level = vim.log.levels.WARN,
	},
}

return M
