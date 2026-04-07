return {
	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			-- MDX
			vim.filetype.add({
				extension = {
					mdx = "mdx",
				},
			})
			vim.treesitter.language.register("markdown", "mdx")

			-- Treesitter options
			opts.ensure_installed = {
				"cmake",
				"css",
				"fish",
				"gitignore",
				"http",
				"java",
				"scss",
				"sql",
				"typescript",
				"kotlin",
			}
			opts.highlight = { enable = true }
			-- opts.matchup = { enable = true } -- Uncomment if needed
			opts.query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			}
			opts.playground = {
				enable = true,
				disable = {},
				updatetime = 25,
				persist_queries = true,
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			}
			return opts
		end,
	},
}
