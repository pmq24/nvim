-- SUPPORTED LANGUAGES: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local LANGUAGE_SERVERS = {
	"dockerls",
	"jsonls",
	"lua_ls",
	"rubocop",
	"solargraph",
	"tailwindcss",
	"tsserver",
	"yamlls",
}

local M = {
	"neovim/nvim-lspconfig",
	cmd = {
		"LspInfo",
		"LspLog",
		"LspRestart",
		"LspStart",
		"LspStop",
	},
	dependencies = {
		"folke/neodev.nvim",
		"folke/which-key.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"nvim-treesitter/nvim-treesitter",
	},
	event = "BufReadPost",
}

function M.config()
	local lsp = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	for _, server in ipairs(LANGUAGE_SERVERS) do
		lsp[server].setup({
			capabilities = capabilities,
		})
	end

	lsp.lua_ls.setup({
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	})

	require("helpers.register_which_key").add({
		{
			"K",
			desc = "(LSP) Hover",
			function()
				vim.lsp.buf.hover()
			end,
		},
	})
end

return M
