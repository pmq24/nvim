-- SUPPORTED LANGUAGES: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local LANGUAGE_SERVERS = {
	"dockerls",
	"lua_ls",
	"ruby_ls",
	"rubocop",
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
			handlers = {
				["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = false,
				}),
			},
		})
	end
end

return M
