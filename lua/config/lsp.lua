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
	cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
})

lspconfig.bashls.setup({
    on_attach = require("mason-lspconfig").on_attach,
    on_init = require("mason-lspconfig").on_init,
    capabilities = require("mason-lspconfig").capabilities,
})

lspconfig.jsonls.setup({
    on_attach = require("mason-lspconfig").on_attach,
    on_init = require("mason-lspconfig").on_init,
    capabilities = require("mason-lspconfig").capabilities,
})

lspconfig.ts_ls.setup({
    on_attach = require("mason-lspconfig").on_attach,
    on_init = require("mason-lspconfig").on_init,
    capabilities = require("mason-lspconfig").capabilities,
})

lspconfig.rust_analyzer.setup({
    on_attach = require("mason-lspconfig").on_attach,
    on_init = require("mason-lspconfig").on_init,
    capabilities = require("mason-lspconfig").capabilities,
})

lspconfig.gopls.setup({
    on_attach = require("mason-lspconfig").on_attach,
    on_init = require("mason-lspconfig").on_init,
    capabilities = require("mason-lspconfig").capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    single_file_support = true,
    settings = {
        gopls = {
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
})

