local M = {
	"lewis6991/gitsigns.nvim",
	main = "gitsigns",
	opts = {},
}

function M.config(spec, opts)
	require(spec.main).setup(opts)

	require("helpers.register_which_key").add({
		{ "<leader>g", group = "Git" },
		{
			"<leader>gb",
			desc = "(Gitsigns) Blame line",
			function()
				vim.cmd("Gitsign blame_line")
			end,
		},
	})
end

return M
