-- setup mason before configuring lsp
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"gopls",
		"rust_analyzer",
		"pyright",
		"ts_ls",
		"bashls",
		"jsonls",
	},
	automatic_installation = true,
})

-- initialize servers with default mason-lspconfig
local lspconfig = require("lspconfig")

-- pyright setup
lspconfig.pyright.setup({
	on_attach = require("mason-lspconfig").on_attach,
	on_init = require("mason-lspconfig").on_init,
	capabilities = require("mason-lspconfig").capabilities,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
})

--

