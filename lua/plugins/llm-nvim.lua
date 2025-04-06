return {
	dir = "~/.config/nvim/lua/custom/llm-nvim",
	name = "llm-nvim",
	dependencies = {
		"folke/noice.nvim",
	},
	config = function()
		require("custom.llm-nvim")
	end,
}
