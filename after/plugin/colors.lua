local TRANSPARENT = true;
local THEME = "wave"
function setup()
	require('kanagawa').setup({
		compile = false,
		undercurl = true,
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		transparent = TRANSPARENT,
		dimIncactive = false,
		terminalColors = false,
		colors = {
			palette = {},
			theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
		},
		overrides = function(colors)
			return  {}
		end,
		theme = "wave",
		background = {
			dark = "wave",
			light = "lotus"
		},
	})
end 

function Theme(color)
	color = color or "kanagawa"
	vim.cmd("colorscheme "..color)

    if TRANSPARENT then
        vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "NONE", fg = "#e0af68" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "NONE", fg = "#e46876" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = "NONE", fg = "#e46876" })
        vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "NONE", fg = "#e0af68" })
        vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticSignHint", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
    end
end

vim.api.nvim_create_user_command("ToggleTrans", function()
	TRANSPARENT = not TRANSPARENT
	setup()
	Theme()
end, { nargs = "?" })

setup()
Theme()
