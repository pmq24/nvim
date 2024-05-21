vim.keymap.set("n", "<Leader>tl", ":lua require('ror.test').run('Line')<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tf", ":lua require('ror.test').run()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tc", ":lua require('ror.test').clear()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>pp", ":lua require('ror.commands').list_commands()<CR>", { silent = true })

local M = {
	"weizheheng/ror.nvim",
	dependencies = {
		"rcarriga/nvim-notify",
		"stevearc/dressing.nvim"
	},
	main = "ror",
	opts = {
		test = {
			coverage = {
				up = "DiffAdd",
				down = "DiffDelete",
			},
			pass_icon = "👍",
			fail_icon = "👎"
		},
	},
}

return M
