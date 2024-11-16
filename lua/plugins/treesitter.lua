return {
	"nvim-treesitter/nvim-treesitter",
    dependencies = { 
        "nvim-treesitter/nvim-treesitter-textobjects", 
    },
    build = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
    config = function()
        require("nvim-treesitter.configs").setup({
		    ensure_installed = {
			    "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "go",
                "python",
                "javascript",
                "json",
                "yaml",
            },
            highlight = {
                enable = true
            },
        })
    end,
}

