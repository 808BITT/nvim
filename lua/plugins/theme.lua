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
				theme = "powerline",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {
				lualine_a = { "buffers" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "tabs" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "filename" },
				lualine_x = { "fileformat", "filetype" },
				lualine_y = { "encoding", "location", "progress" },
				lualine_z = { "os.date('%A, %b %d %Y %X')", "data", "require'lsp-status'.status()" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})

		require("onedark").setup({
			style = "darker",
		})
		require("onedark").load()
	end,
}
