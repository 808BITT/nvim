require("neoconf").setup({
   --override any of the default settings here
})

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

local lspconfig = require("lspconfig")
local servers = {
	"lua_ls",
	"gopls",
	"rust_analyzer",
	"pyright",
	"ts_ls",
	"bashls",
	"jsonls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = require("mason-lspconfig").on_attach,
		on_init = require("mason-lspconfig").on_init,
		capabilities = require("mason-lspconfig").capabilities,
	})
end



