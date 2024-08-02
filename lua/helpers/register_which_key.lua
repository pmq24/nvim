local M = {}

function M.add(mappings)
	local wk = require("which-key")
	wk.add(mappings)
end

return M
