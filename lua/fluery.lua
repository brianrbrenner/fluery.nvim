local M = {}
local config = require("fluery.config")

local function set_hightlights()
	local highlight_groups = require("fluery.highlights").get_highlight_groups()

	for _, highlights in pairs(highlight_groups) do
		for group, highlight in pairs(highlights) do
			vim.api.nvim_set_hl(0, group, highlight)
		end
	end
end

function M.colorscheme(variant)
  config.extend_options({ variant = variant })
	vim.opt_termguicolors = true
	if vim.g.colors_name then
		vim.cmd("hi clear")
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "fluery"

	set_hightlights()
end

function M.setup(options)
  config.extend_options(options or {})
end

return M
