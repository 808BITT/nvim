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

-- Define a list of buffer types to check
local special_buffers = { "NeogitStatus", "neo-tree", "TelescopePrompt", "alpha" }
vim.api.nvim_create_augroup("AutoCloseSpecialBuffers", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	group = "AutoCloseSpecialBuffers",
	callback = function()
		local buffers = vim.fn.getbufinfo({ buflisted = 1 })
		local all_special = true
		for _, buf in ipairs(buffers) do
			local buf_ft = vim.api.nvim_buf_get_option(buf.bufnr, "filetype")
			if not vim.tbl_contains(special_buffers, buf_ft) then
				all_special = false
				break
			end
		end

		if all_special then
			vim.cmd("qa")
		end
	end,
})
