local M = {}

local function set_hightlights()
	local highlight_groups = require("fluery.highlights").get_highlight_groups()

	for _, highlights in pairs(highlight_groups) do
		for group, highlight in pairs(highlights) do
			vim.api.nvim_set_hl(0, group, highlight)
		end
	end
end
