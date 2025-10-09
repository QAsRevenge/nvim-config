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
		opts = {
			panel = {
				enabled = true,
				auto_refresh = false,
				keymap = {
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
					accept_word = false,
					accept_line = false,
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
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			prompts = {
				ExplainThis = {
					prompt = "Explain this code.",
					system_prompt = "You are a senior level developer that specializes in exaplining code. Keep answers concise and to the point. Dont give any summary tables or use emojis. Use markdown formatting for any code snippets.",
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
			},

			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
