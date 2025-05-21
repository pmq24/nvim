-- SUPPORTED LANGUAGES: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local LANGUAGE_SERVERS = {
	"dockerls",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"rubocop",
	"ruby_lsp",
	"tailwindcss",
	"ts_ls",
	"volar",
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
	local capabilities = vim.tbl_deep_extend(
		"force",
		vim.lsp.protocol.make_client_capabilities(),
		require("cmp_nvim_lsp").default_capabilities()
	)
	capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

	for _, server in ipairs(LANGUAGE_SERVERS) do
		lsp[server].setup({
			capabilities = capabilities,
		})
	end

	lsp.html.setup({})

	lsp.lua_ls.setup({
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	})

	lsp.ts_ls.setup({
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = vim.fn.expand("$MASON/packages")
						.. "/vue-language-server"
						.. "/node_modules/@vue/language-server",
					languages = { "vue" },
				},
			},
		},
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
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
