return {
	"allaman/emoji.nvim",
	ft = "markdown",
	dependencies = "hrsh7th/nvim-cmp",
	opts = {
		enable_cmp_integration = true,
  	},
  	config = function(_, opts)
    		require("emoji").setup(opts)
    		require("telescope").load_extension("emoji")
  	end,
  	dev = true,
}
