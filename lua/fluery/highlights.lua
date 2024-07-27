local M = {}
function M.get_highlight_groups()
  local palette = require("fluery.palette").default
	local highlight_groups = {
		base = {
			Normal = { fg = palette.muted, bg = palette.bg },
			Comment = { fg = palette.comment },
		},
		syntax_groups = {
			-- See :help group-name
			Constant = { fg = palette.dark_green },
			String = { fg = palette.orange },
			Character = { link = "Constant" },
			Number = { link = "String" },
			Boolean = { link = "String" },
			Float = { link = "String" },

			Identifier = { fg = palette.light_brown },
			Function = { fg = palette.light_red },

			Statement = { fg = palette.pale_orange },
			Conditional = { link = "Statement" },
			Repeat = { link = "Statement" },
			Label = { link = "Statement" },
			Operator = { fg = palette.less_pale_red },
			Keyword = { link = "Statement" },
			Exception = { link = "Statement" },

			PreProc = { fg = palette.pale_red },
			-- Include = { link = palette.orange },
			-- Define = { link = "PreProc" },
			Macro = { fg = palette.pale_blue },
			PreCondit = { link = "PreProc" },

			Type = { fg = palette.yellow_brown },
			StorageClass = { link = "Type" },
			Structure = { link = "Type" },
			Typedef = { link = "Statement" },

			Special = { fg = palette.yellow },
			SpecialChar = { fg = "#4E5E46" },
			Tag = { link = "Special" },
			Delimiter = { fg = palette.muted },
			SpecialComment = { link = "Special" },
			Debug = { fg = palette.orange },

			Underlined = { fg = palette.brown, underline = true },
			Ignore = { fg = palette.muted },
			Error = { fg = palette.red, bold = true },
			Todo = { fg = palette.yellow },

			Added = { fg = palette.green },
			Changed = { fg = palette.yellow },
			Removed = { fg = palette.red },
		},
		-- See https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
		tree_sitter = {
			-- Identifiers
			["@variable"] = { link = "Identifier" },
			["@variable.builtin"] = { link = "Macro" },
			["@variable.parameter"] = { link = "@variable" },
			["@variable.parameter.builtin"] = { fg = "#c9598a" },
			["@variable.member"] = { link = "@variable" },
			["@constant"] = { link = "Constant" },
			["@constant.builtin"] = { fg = palette.dark_green },
			["@constant.macro"] = { link = "Macro" },
			["@module"] = { link = "Include" },
			["@module.builtin"] = { link = "@module" },
			["@label"] = { link = "Label" },
			-- Literals
			["@string"] = { link = "String" },
			["@string.regexp"] = { fg = palette.yellow },
			["@string.escape"] = { fg = palette.yellow },
			["@string.special"] = { link = "Special" },
			["@string.special.symbol"] = { link = "Identifier" },
			["@string.special.url"] = { link = "Underlined" },
			["@string.special.path"] = { link = "Directory" },
			["@character"] = { link = "Character" },
			["@character.special"] = { link = "SpecialChar" },
			["@boolean"] = { link = "Boolean" },
			["@number"] = { link = "Number" },
			["@number.float"] = { link = "Float" },
			-- Types
			["@type"] = { link = "Type" },
			["@type.builtin"] = { link = "@type" },
			["@property"] = { link = "Identifier" },
			--- Functions
			["@function"] = { link = "Function" },
			["@function.builtin"] = { link = "@function" },
			["@function.call"] = { link = "@function" },
			["@function.macro"] = { link = "Macro" },
			["@function.method"] = { link = "@function" },
			["@function.method.call"] = { link = "@function" },
			["@constructor"] = { fg = "#c9598a" },
			["@operator"] = { link = "Operator" },
			-- Keywords
			["@keyword"] = { link = "Keyword" },
			["@keyword.operator"] = { link = "Keyword" },
			["@keyword.debug"] = { link = "Debug" },
			["@keyword.exception"] = { link = "Exception" },
			["@keyword.directive"] = { link = "PreProc" },
			["@keyword.directive.define"] = { link = "Define" },
			-- Punctuation
			["@punctuation.delimiter"] = { link = "Delimiter" },
			["@punctuation.bracket"] = { fg = palette.subtle },
			["@punctuation.special"] = { link = "Special" },
			-- Comments
			["@comment"] = { link = "Comment" },
			["@comment.error"] = { fg = palette.red },
			["@comment.warning"] = { fg = palette.orange },
			["@comment.todo"] = { fg = "#ffdd23", bold = true },
			["@comment.note"] = { fg = "#ffdd23", bold = true },
			-- Markup
			["@tag"] = { link = "Tag" },
			["@tag.attribute"] = { link = "@variable.parameter" },
			["@tag.delimiter"] = { link = "delimiter" },
			["@markup.strong"] = { bold = true },
			["@markup.italic"] = { italic = true },
			["@markup.strikethrough"] = { strikethrough = true },
			["@markup.underline"] = { underline = true },
			["@markup.heading"] = { fg = palette.tx, bold = true },
			["@markup.heading.1"] = { link = "@markup.heading" },
			["@markup.heading.2"] = { link = "@markup.heading" },
			["@markup.heading.3"] = { link = "@markup.heading" },
			["@markup.heading.4"] = { link = "@markup.heading" },
			["@markup.heading.5"] = { link = "@markup.heading" },
			["@markup.heading.6"] = { link = "@markup.heading" },
			["@markup.quote"] = { fg = palette.subtle },
			["@markup.math"] = { fg = palette.green },
			["@markup.link"] = { fg = palette.blue },
			["@markup.link.label"] = { fg = palette.blue },
			["@markup.link.url"] = { fg = palette.blue, underline = true },
			["@markup.raw"] = { fg = palette.subtle },
			["@markup.raw.block"] = { link = "@markup.raw" },
			["@markup.list"] = { fg = palette.tx },
			["@markup.list.checked"] = { fg = palette.green },
			["@markup.list.unchecked"] = { fg = palette.tx },
			--- Non-highlighting captures
			["@conceal"] = { link = "Conceal" },
			["@conceal.markdown"] = { fg = palette.subtle },
			["@conceal.markdown_inline"] = { fg = palette.subtle },
			--- Semantic
			-- cpp
			["@keyword.type.cpp"] = { fg = "#2895c7" },
			-- zig
			["@keyword.modifier.zig"] = { fg = "#2895c7" },

			["@lsp.type.enum"] = { link = "@type" },
			["@lsp.type.interface"] = { link = "@interface" },
			["@lsp.type.keyword"] = { link = "@keyword" },
			["@lsp.type.namespace"] = { fg = "#c9598a" },
			["@lsp.type.modifier"] = { fg = "#2895c7" },
			["@lsp.type.enumMember"] = { fg = "#a7eb13" },
			["@lsp.type.namespace.python"] = { link = "@variable" },
			["@lsp.type.parameter"] = { link = "@parameter" },
			["@lsp.type.property"] = { link = "@property" },
			["@lsp.type.variable.svelte"] = { link = "@variable" },
			["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
			["@lsp.typemod.operator.injected"] = { link = "@operator" },
			["@lsp.typemod.string.injected"] = { link = "@string" },
			["@lsp.typemod.variable.constant"] = { link = "@constant" },
			["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
			["@lsp.typemod.variable.injected"] = { link = "@variable" },
		},
		ui = {
			-- See :help highlight-groups
			ColorColumn = { bg = palette.surface },
			Conceal = { fg = palette.subtle, bg = palette.hilite_lo },
			CurSearch = { fg = palette.bg, bg = palette.magenta },
			Cursor = { fg = palette.tx, bg = palette.hilite_hi },
			CursorColumn = { bg = palette.surface },
			CursorLine = { bg = palette.surface },
			CursorLineNr = { fg = palette.tx },
			Directory = { fg = palette.blue, bold = true },
			ErrorMsg = { fg = palette.red, bold = true },
			FloatBorder = { fg = palette.blue, bg = palette.surface },
			FloatTitle = { bold = true, bg = palette.surface },
			FoldColumn = { fg = palette.subtle },
			Folded = { bg = palette.hilite_lo },
			IncSearch = { link = "CurSearch" },
			LineNr = { fg = palette.muted },
			MatchParen = { bg = palette.red },
			ModeMsg = { fg = palette.subtle },
			MoreMsg = { fg = palette.green },
			NonText = { fg = palette.muted },
			NormalFloat = { fg = palette.tx, bg = palette.surface },
			NormalNC = { fg = palette.subtle },
			NvimInternalError = { link = "ErrorMsg" },
			Pmenu = { fg = palette.tx, bg = palette.surface },
			PmenuSel = { fg = palette.tx, bg = palette.hilite_med, bold = true },
			PmenuThumb = { bg = palette.muted },
			Question = { fg = palette.yellow },
			QuickFixLine = { fg = palette.magenta, bg = palette.overlay, bold = true },
			Search = { fg = palette.magenta, bold = true, underline = true },
			SignColumn = { fg = palette.tx },
			SpecialKey = { fg = palette.blue },
			StatusLine = { fg = palette.subtle, bold = true },
			StatusLineNC = { fg = palette.muted },
			StatusLineTerm = { fg = palette.bg, bg = palette.green, bold = true },
			StatusLineTermNC = { fg = palette.surface, bg = palette.green },
			Substitute = { link = "IncSearch" },
			TabLine = { fg = palette.subtle, bg = palette.surface },
			TabLineFill = { bg = palette.surface },
			TabLineSel = { fg = palette.tx, bg = palette.hilite_med, bold = true },
			Title = { bold = true },
			Visual = { bg = palette.hilite_med },
			WarningMsg = { fg = palette.red, bold = true },
			WildMenu = { link = "IncSearch" },
			WinBar = { link = "StatusLine" },
			WinBarNC = { link = "StatusLineNc" },
			WinSeparator = { fg = palette.hilite_hi },
		},
		diagnostics = {
			DiagnosticDeprecated = { sp = palette.red, undercurl = true },
			DiagnosticError = { fg = palette.red },
			DiagnosticHint = { fg = palette.yellow },
			DiagnosticInfo = { fg = palette.blue },
			DiagnosticOk = { fg = palette.green },
			DiagnosticWarn = { fg = palette.orange },
			DiagnosticUnderlineError = { sp = palette.red, undercurl = true },
			DiagnosticUnderlineHint = { sp = palette.yellow, undercurl = true },
			DiagnosticUnderlineInfo = { sp = palette.pale_blue, undercurl = true },
			DiagnosticUnderlineOk = { sp = palette.green, undercurl = true },
			DiagnosticUnderlineWarn = { sp = palette.orange, undercurl = true },
			DiagnosticVirtualTextError = { fg = palette.red, bg = palette.overlay },
			DiagnosticVirtualTextHint = { fg = palette.yellow, bg = palette.overlay },
			DiagnosticVirtualTextInfo = { fg = palette.blue, bg = palette.overlay },
			DiagnosticVirtualTextWarn = { fg = palette.orange, bg = palette.overlay },

			DiagnosticDefaultError = { link = "DiagnosticError" },
			DiagnosticDefaultHint = { link = "DiagnosticHint" },
			DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
			DiagnosticDefaultWarn = { link = "DiagnosticWarn" },
			DiagnosticFloatingError = { link = "DiagnosticError" },
			DiagnosticFloatingHint = { link = "DiagnosticHint" },
			DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
			DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
			DiagnosticSignError = { link = "DiagnosticError" },
			DiagnosticSignHint = { link = "DiagnosticHint" },
			DiagnosticSignInfo = { link = "DiagnosticInfo" },
			DiagnosticSignWarn = { link = "DiagnosticWarn" },
		},
		diffs = {
			DiffText = { fg = palette.yellow, bold = true },

			DiffAdd = { link = "Added" },
			DiffChange = { link = "Changed" },
			DiffDelete = { link = "Removed" },
			GitSignsAdd = { link = "SignAdd" },
			GitSignsChange = { link = "SignChange" },
			GitSignsDelete = { link = "SignDelete" },
			SignAdd = { link = "DiffAdd" },
			SignChange = { link = "DiffChange" },
			SignDelete = { link = "DiffDelete" },
			["@diff.delta"] = { link = "DiffChange" },
			["@diff.minus"] = { link = "DiffDelete" },
			["@diff.plus"] = { link = "DiffAdd" },
			diffAdded = { link = "DiffAdd" },
			diffChanged = { link = "DiffChange" },
			diffRemoved = { link = "DiffDelete" },
		},
		spell = {
			SpellBad = { sp = palette.red, undercurl = true },
			SpellCap = { sp = palette.yellow, undercurl = true },
			SpellLocal = { sp = palette.green, undercurl = true },
			SpellRare = { sp = palette.cyan, undercurl = true },
		},
		telescope = {
			TelescopeBorder = { link = "FloatBorder" },
			TelescopeTitle = { link = "FloatTitle" },
			TelescopeNormal = { link = "NormalFloat" },
			TelescopePreviewMatch = { link = "IncSearch" },
			TelescopeMatching = { link = "Search" },
		},
		cmp = {
			CmpItemAbbr = { fg = palette.subtle },
			CmpItemAbbrDeprecated = { fg = palette.subtle, strikethrough = true },
			CmpItemAbbrMatch = { fg = palette.tx, bold = true },
			CmpItemAbbrMatchFuzzy = { fg = palette.tx, bold = true },
			CmpItemKind = { fg = palette.subtle },

			CmpItemKindClass = { link = "StorageClass" },
			CmpItemKindFunction = { link = "Function" },
			CmpItemKindInterface = { link = "Type" },
			CmpItemKindMethod = { link = "PreProc" },
			CmpItemKindSnippet = { link = "String" },
			CmpItemKindVariable = { link = "Identifier" },
		},
	}
	return highlight_groups
end

return M
