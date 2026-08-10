if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd
vim.api.nvim_set_hl(0, "CopilotChatHeader", { fg = "#7C3AED", bold = true })
vim.api.nvim_set_hl(0, "CopilotChatSeparator", { fg = "#374151" })

require("config.lazy")
