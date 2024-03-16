local M = {
	"haishanh/night-owl.vim",
	lazy = false,
	priority = 1000,
}

function M.init()
	vim.cmd("colorscheme night-owl")
end

return M
