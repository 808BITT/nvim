return {
	"masukomi/vim-markdown-folding",
	ft = "markdown",
	setup = function()
		vim.g.vim_markdown_folding_level = 3
		vim.g.vim_markdown_folding_style = "pythonic"
	end,
}
