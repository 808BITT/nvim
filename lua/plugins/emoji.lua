return {
	"allaman/emoji.nvim",
	version = false, -- optionally pin to a tag
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
	},
	config = function(_, opts)
		require("emoji").setup(opts)
		require("telescope").load_extension("emoji")
		vim.api.nvim_create_user_command("Emojis", "Telescope emoji", {})
	end,
	opts = {
		enable_cmp_integration = true,
	},
}
