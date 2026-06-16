--[[return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "storm", -- or "night", "moon", "day"
			on_colors = function(colors)
				colors.bg_dark = "#1a1b26"
			end,
			on_highlights = function(highlights, colors)
				highlights.CursorLine = { bg = colors.bg_dark }
			end,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
			},
			transparent = true,
			terminal_colors = true,
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}]]

return {
	"scottmckendry/cyberdream.nvim",
	config = function()
		require("cyberdream").setup({
			lazy = false,
			priority = 1000,
			transparent = true,
			italic_comments = true,
			borderless_pickers = false,
			terminal_colors = true,
			saturation = 1.25,
			cache = true,

			highlights = {
				CursorLine = { bg = "#111827" },

				Visual = {
					bg = "#00F7FF",
					fg = "#0A0E14",
				},

				Search = {
					bg = "#FF3D81",
					fg = "#FFFFFF",
				},

				IncSearch = {
					bg = "#00F7FF",
					fg = "#0A0E14",
				},
			},
		})
		vim.cmd.colorscheme("cyberdream")
	end,
}
