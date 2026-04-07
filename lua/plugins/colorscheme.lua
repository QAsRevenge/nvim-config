return {
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
<<<<<<< HEAD
			transparent = true,
=======
			transparent = false,
>>>>>>> cb8e9a6a60a0c1aeb4d3bd1609f8d7562c90b9a1
			terminal_colors = true,
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
