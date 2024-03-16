local M = {
	"ggandor/leap.nvim",
	dependencies = {
		"tpope/vim-repeat",
	},
	lazy = false,
}

function M.config()
	local leap = require("leap")

	leap.opts.special_keys.prev_group = "<bs>"
	leap.opts.special_keys.prev_target = "<bs>"
	leap.opts.highlight_unlabeled_phase_one_targets = true
	require("leap.user").set_repeat_keys("<cr>", "<bs>")
end

return M
