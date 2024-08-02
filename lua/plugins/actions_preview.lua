local M = {
	"aznhe21/actions-preview.nvim",
	event = { "BufReadPost" },
	main = "actions-preview",
	opts = {},
}

function M.config(spec, opts)
	require(spec.main).setup(opts)

	require("helpers.register_which_key").add({
		{
			"m",
			desc = "Code action",
			function()
				require("actions-preview").code_actions()
			end,
		},
	})
end

return M
