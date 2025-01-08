return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	config = function()
		require("neogit").setup({
			graph_style = "unicode",
			integrations = {
				telescope = true,
				diffview = true,
			},
			signs = {
				-- { CLOSED, OPENED }
				section = { "", "" },
				item = { "", "" },
				hunk = { "", "" },
			},
		})

		vim.api.nvim_set_hl(0, "NeogitDiffDeletions", { fg="#000000", bg = "#fb6d89" })
		vim.api.nvim_set_hl(0, "NeogitDiffDelete", { fg="#000000", bg = "#fb6d89" })
		vim.api.nvim_set_hl(0, "NeogitDiffDeleteCursor", { fg="#000000", bg = "#fb6d89" })
		vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { fg="#000000", bg = "#fb6d89" })
		vim.api.nvim_set_hl(0, "NeogitDiffAdditions", { fg="#000000", bg = "#b2e068" })
		vim.api.nvim_set_hl(0, "NeogitDiffAdd", { fg="#000000", bg = "#b2e068" })
		vim.api.nvim_set_hl(0, "NeogitDiffAddCursor", { fg="#000000", bg = "#b2e068" })
		vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { fg="#000000", bg = "#b2e068" })
	end,
}
