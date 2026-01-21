return {
	"catppuccin/nvim",
	lazy = false,
	flavor = "mocha", -- latte, frappe, macchiato, mocha
	background = {
		light = "latte",
		dark = "mocha",
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = { "italic" },
		functions = { "bold" },
		keywords = { "bold" },
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = { "bold" },
		operators = {},
	},
	priority = 1000,
	config = function()
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration.
		vim.cmd.colorscheme("catppuccin")
	end,
}
