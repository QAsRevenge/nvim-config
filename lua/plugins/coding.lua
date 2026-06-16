return {
	-- Incremental rename
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},

	-- Better increase/descrease
	{
		"monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},

	-- copilot
	{
		"zbirenbaum/copilot.lua",
		requires = {
			"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
		},
		opts = {
			panel = {
				enabled = true,
				auto_refresh = false,
				keymap = {
					accept = "<CR>",
					jump_prev = "[[",
					jump_next = "]]",
					refresh = "gr",
					open = "<M-CR>",
				},
				layout = {
					position = "bottom", -- | top | left | right | horizontal | vertical
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				hide_during_completion = true,
				debounce = 75,
				keymap = {
					accept = "<Tab>",
					accept_word = "<M-Right>",
					accept_line = "<M-Down>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
			},
			copilot_node_command = "node", -- Node.js version must be > 20
			workspace_folders = {},
			copilot_model = "gpt-4o-copilot", -- Current LSP default is gpt-35-turbo, supports gpt-4o-copilot
			root_dir = function()
				return vim.fs.dirname(vim.fs.find(".git", { upward = true })[1])
			end,
			should_attach = function(_, _)
				if not vim.bo.buflisted then
					return false
				end

				if vim.bo.buftype ~= "" then
					return false
				end

				return true
			end,
			server = {
				type = "nodejs", -- "nodejs" | "binary"
				custom_server_filepath = nil,
			},
			server_opts_overrides = {},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			prompts = {
				ExplainThis = {
					prompt = "Explain this code.",
					system_prompt = "You are a senior level developer that specializes in explaining code. Keep answers concise and to the point. Dont give any summary tables or use emojis. Use markdown formatting for any code snippets.",
					mapping = "<leader>aie",
					description = "Explain this code",
				},
				UnitTestThis = {
					prompt = "Write unit tests for the following code.",
					system_prompt = "You are a senior level developer that specializes in writing unit tests. Use the most appropriate testing framework for the language. Keep answers concise and to the point. Dont give any summary tables or use emojis. Use markdown formatting for any code snippets.",
					mapping = "<leader>ait",
					description = "Write unit tests for this code",
				},
				ImproveThis = {
					prompt = "Improve this code.",
					system_prompt = "You are a senior level developer that specializes in improving code. Focus on core coding principles, like simplicity, DRYness, maintanability and robustness. Keep answers concise and to the point. Dont give any summary tables or use emojis. Use markdown formatting for any code snippets.",
					mapping = "<leader>aii",
					description = "Improve this code",
				},
				SuggestImprovements = {
					prompt = "Suggest improvements for the following code.",
					system_prompt = "You are a senior level developer that specializes in suggesting improvements for code, design patterns and architecture. Focus on core coding principles, like simplicity, DRYness, maintainability and robustness. Keep answers concise and to the point. Don't give any summary tables or use emojis. Use markdown formatting for any code snippets.",
					mapping = "<leader>ais",
					description = "Suggest improvements for this code",
				},
				AskAboutFile = {
					prompt = "Answer questions about the current file. Use the file content as context.",
					system_prompt = "You are an expert developer. Use the entire file as context to answer questions, provide suggestions, or refactor code. Be concise and use markdown formatting for code.",
					mapping = "<leader>aif",
					description = "Ask about current file",
					context = "file",
				},
				AskAboutWorkspace = {
					prompt = "Answer questions about the workspace. Use all relevant files as context.",
					system_prompt = "You are an expert developer. Use the workspace/project files as context to answer questions, provide suggestions, or refactor code. Be concise and use markdown formatting for code.",
					mapping = "<leader>aiw",
					description = "Ask about workspace",
					context = "workspace",
				},
			},

			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	{
		"pwntester/octo.nvim",
		cmd = "Octo",
		opts = {
			-- or "fzf-lua" or "snacks" or "default"
			picker = "telescope",
			-- bare Octo command opens picker of commands
			enable_builtin = true,
			github_hostname = "github.com",
			ssh_aliases = { ["github.com-work"] = "github.com" },
		},
		keys = {
			{
				"<leader>oi",
				"<CMD>Octo issue list<CR>",
				desc = "List GitHub Issues",
			},
			{
				"<leader>op",
				"<CMD>Octo pr list<CR>",
				desc = "List GitHub PullRequests",
			},
			{
				"<leader>od",
				"<CMD>Octo discussion list<CR>",
				desc = "List GitHub Discussions",
			},
			{
				"<leader>on",
				"<CMD>Octo notification list<CR>",
				desc = "List GitHub Notifications",
			},
			{
				"<leader>os",
				function()
					require("octo.utils").create_base_search_command({ include_current_repo = true })
				end,
				desc = "Search GitHub",
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			-- OR "ibhagwan/fzf-lua",
			-- OR "folke/snacks.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
