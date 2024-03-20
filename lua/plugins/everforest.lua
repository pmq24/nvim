local M = {
"neanias/everforest-nvim",
  lazy = false,
	main = "everforest",
	opts = {},
  priority = 1000,
}

function M.init()
	vim.cmd("colorscheme everforest")
end

return M
