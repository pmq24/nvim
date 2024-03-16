local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/nvim-cmp",
	},
	event = "InsertEnter",
}

function M.config()
	local cmp = require("cmp")

	cmp.setup({
		mapping = {
			["<A-l>"] = function(fallback)
				if cmp.visible() and cmp.get_selected_entry() == nil then
					cmp.select_next_item()
				else
					fallback()
				end
			end,
			h = function(fallback)
				if cmp.get_selected_entry() ~= nil then
					cmp.abort()
				else
					fallback()
				end
			end,
			j = function(fallback)
				if cmp.get_selected_entry() ~= nil then
					cmp.select_next_item()
				else
					fallback()
				end
			end,
			k = function(fallback)
				if cmp.get_selected_entry() ~= nil then
					cmp.select_prev_item()
				else
					fallback()
				end
			end,
			l = function(fallback)
				if cmp.get_selected_entry() ~= nil then
					cmp.confirm()
				else
					fallback()
				end
			end,
		},
		preselect = cmp.PreselectMode.Item,
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
		}, {
			{ name = "buffer" },
		}),
		view = {
			docs = {
				auto_open = true,
			},
		},
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "cmdline" },
		}, {
			{ name = "path" },
		}),
	})
end

return M
