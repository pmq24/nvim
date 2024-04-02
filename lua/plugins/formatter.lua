local M = {
	"mhartington/formatter.nvim",
	cmd = {
		"Format",
		"FormatLock",
		"FormatWrite",
		"FormatWriteLock",
	},
	main = "formatter",
}

function M.config(spec, _)
	require(spec.main).setup({
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
		command = ":FormatWriteLock",
		pattern = "*",
	})
end

return M
