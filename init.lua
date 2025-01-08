-- setup vim settings
require("config.settings")

-- bootstrap lazy and load ../lua/plugins
require("config.lazy")

-- setup mason and lsp settings
require("config.lsp")

-- setup autocommands
require("config.autocmds")

-- setup mappings
require("config.keymaps")

-- Set cursor shape to a blinking block in normal mode and a blinking vertical bar in insert mode
vim.opt.guicursor = "n-v-c:block-blinkon1,i-ci:ver25-blinkon1"

-- Restore cursor to a blinking block upon exiting Neovim
vim.api.nvim_create_autocmd("VimLeave", {
	pattern = "*",
	command = "set guicursor=a:block-blinkon1",
})

vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	command = "set guicursor=n-v-c:block-blinkon1,i-ci:ver25-blinkon1",
})
