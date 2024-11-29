return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"bluz71/vim-moonfly-colors",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "iceberg_dark",
			},
			sections = {
				-- lualine_a = { 'mode' },
				-- lualine_b = { 'branch' },
				-- lualine_c = { 'filename' },
				-- lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { "location" },
				lualine_z = { "os.date('%A, %b %d %Y %X')", "data", "require'lsp-status'.status()" },
			},
		})
	end,
}
