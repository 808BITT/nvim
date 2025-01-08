vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_newline_comment", { clear = true }),
	pattern = "*",
	command = "setlocal formatoptions-=cro",
	desc = "Disables automatic commenting on newline",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
