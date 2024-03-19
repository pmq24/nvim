local M = {
	"mhartington/formatter.nvim",
	cmd = {
		"Format",
		"FormatLock",
		"FormatWrite",
		"FormatWriteLock",
	},
}

function M.config()
	require("formatter").setup({
		filetype = {
			lua = {
				require("formatter.filetypes.lua").stylua,
			},
			ruby = {
				require("formatter.filetypes.ruby").rubocop,
				function()
					return {
						"--auto-correct",
					}
				end,
			},
			typescript = {
				require("formatter.filetypes.typescript").prettierd,
			},
			typescriptreact = {
				require("formatter.filetypes.typescriptreact").prettierd,
			},
			yaml = {
				require("formatter.filetypes.yaml").prettierd,
			},
		},
		logging = true,
	})

	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = "*",
		command = ":FormatWrite",
	})
end

return M
