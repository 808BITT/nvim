return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		-- "bluz71/vim-moonfly-colors",
		-- "ribru17/bamboo.nvim",
		"navarasu/onedark.nvim",
	},
	config = function()
		require("lualine").setup({
			options = {
				-- theme = "iceberg_dark",
				theme = "ayu_mirage",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "buffers" },
				lualine_x = {},
				lualine_y = { "os.date('%A, %b %d %Y %X')" },
				lualine_z = {},
			},
			inactive_winbar = {},
			tabline = {},
			inactive_tabline = {},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				-- lualine_y = { "location", "progress" },
				lualine_y = {},
				lualine_z = { "tabs" },
			},
			inactive_sections = {},
		})

		require("onedark").setup({
			style = "darker",
		})
		require("onedark").load()
	end,
}
