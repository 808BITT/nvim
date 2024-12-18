return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	config = function()
		require("neogit").setup({
			kind = "replace",
			graph_style = "unicode",
			integrations = {
				telescope = true,
				diffview = true,
			},
			-- customize displayed signs
			signs = {
				-- { CLOSED, OPENED }
				section = { "", "" },
				item = { "", "" },
				hunk = { "", "" },
			},
		})
	end,
}
