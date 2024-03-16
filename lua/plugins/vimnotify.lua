local M = {
	"rcarriga/nvim-notify",
	lazy = false,
}

function M.config(plugin_spec, opts)
	require("notify").setup({
		max_width = 100,
		render = "wrapped-compact",
		top_down = false,
	})
	vim.notify = require("notify")
end

return M
