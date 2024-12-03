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
-- Place this in your Neovim configuration file (e.g., init.lua)

-- Define a list of auxiliary buffer types to check
local auxiliary_buffers = { "Neogit", "neo-tree", "Telescope", "alpha" }

-- Create an autocommand group
vim.api.nvim_create_augroup("AutoCloseAuxiliaryBuffers", { clear = true })

-- Set up the autocommand
vim.api.nvim_create_autocmd("BufEnter", {
	group = "AutoCloseAuxiliaryBuffers",
	callback = function()
		print("BufEnter")
		-- Get the list of all listed (normal) buffers
		local buffers = vim.fn.getbufinfo()

		-- if length of buffers is >1, close first buffer if its name = ""
		if #buffers > 1 then
			if vim.api.nvim_buf_get_name(buffers[1].bufnr) == "" then
				vim.cmd("bdelete " .. buffers[1].bufnr)
			end
		end

		-- Check if all listed buffers are auxiliary buffers
		local all_auxiliary = true
		for _, buf in ipairs(buffers) do
			local buf_ft = vim.api.nvim_buf_get_option(buf.bufnr, "filetype")
			if not vim.tbl_contains(auxiliary_buffers, buf_ft) then
				all_auxiliary = false
				break
			end
		end
		-- If all remaining buffers are auxiliary, quit Neovim
		if all_auxiliary then
			vim.cmd("qa")
		end
	end,
})
