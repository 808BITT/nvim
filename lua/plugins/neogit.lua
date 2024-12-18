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
			commit_editor = {
				kind = "replace",
				show_staged_diff = true,
				staged_diff_split = "auto",
				spell_check = true,
			},
			commit_select_view = {
				kind = "replace",
			},
			commit_view = {
				kind = "replace",
				verify_commit = vim.fn.executable("gpg") == 1, -- Can be set to true or false, otherwise we try to find the binary
			},
			log_view = {
				kind = "replace",
			},
			rebase_editor = {
				kind = "replace",
			},
			reflog_view = {
				kind = "replace",
			},
			merge_editor = {
				kind = "replace",
			},
			description_editor = {
				kind = "auto",
			},
			tag_editor = {
				kind = "auto",
			},
			preview_buffer = {
				kind = "floating_console",
			},
			popup = {
				kind = "split",
			},
			stash = {
				kind = "auto",
			},
			refs_view = {
				kind = "auto",
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
