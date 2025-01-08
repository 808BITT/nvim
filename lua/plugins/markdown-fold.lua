return {
	"masukomi/vim-markdown-folding",
	ft = "markdown",
	setup = function()
		vim.g.vim_markdown_folding_level = 0
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "StackedMarkdownFolds()"
	end,
}
