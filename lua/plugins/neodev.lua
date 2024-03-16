local M = {
	"folke/neodev.nvim",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	ft = { "lua" },
}

function M.enabled()
	return string.find(vim.loop.cwd(), ".config/nvim")
end

return M
