return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup()
		require("mini.align").setup()
		require("mini.animate").setup()
		require("mini.cursorword").setup()
		-- require("mini.completion").setup()
		require("mini.icons").setup()
		require("mini.pairs").setup()
		require("mini.surround").setup()
	end,
}
