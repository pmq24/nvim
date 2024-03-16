local M = {
	"williamboman/mason.nvim",
	lazy = false,
}

function M.config()
	require("mason").setup({
		log_level = vim.log.levels.WARN,
		ui = {
			border = "rounded",
			icons = {
				package_installed = "",
				package_pending = "",
				package_uninstalled = "",
			},
		},
	})
end

return M
