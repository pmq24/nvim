local M = {
	"olivercederborg/poimandres.nvim",
	enabled = false,
	lazy = false,
	priority = 1000,
}

function M.init()
	vim.cmd("colorscheme poimandres")
end

return M
