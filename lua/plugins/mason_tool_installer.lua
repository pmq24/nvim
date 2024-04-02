local M = {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	build = ":MasonToolsInstall",
	dependencies = {
		"williamboman/mason.nvim",
	},
	lazy = false,
	main = "mason-tool-installer",
	opts = {
		ensure_installed = {
			"dockerfile-language-server",
			"eslint-lsp",
			"js-debug-adapter",
			"json-lsp",
			"html-lsp",
			"lua-language-server",
			"prettierd",
			"solargraph",
			"sorbet",
			"standardrb",
			"stylua",
			"typescript-language-server",
			"rubocop",
			"yaml-language-server",
		},
		log_level = vim.log.levels.WARN,
	},
}

return M
