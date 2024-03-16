local M = {
	"mhartington/formatter.nvim",
	cmd = {
		"Format",
		"FormatWrite",
		"FormatLock",
		"FormatWriteLock",
	},
	enabled = false,
}

function M.config()
	require("formatter").setup({
		filetype = {
			lua = {
				require("formatter.filetypes.lua").stylua,
				require("formatter.filetypes.ruby").rubocop,
			},
		},
		logging = true,
	})
end

return M
