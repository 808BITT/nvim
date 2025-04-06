-- setup mason before configuring lsp
require("mason").setup({
	ensure_installed = {
		"lua_ls",
		"gopls",
		"rust_analyzer",
		"pyright",
		"ts_ls",
		"bashls",
		"jsonls",
		"prettier",
	},
	icons = {
		package_installed = "✓",
		package_pending = "➜",
		package_uninstalled = "✗",
	},
})
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
				assignVariableTypes = false,
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

lspconfig.lua_ls.setup({
	on_attach = require("mason-lspconfig").on_attach,
	on_init = require("mason-lspconfig").on_init,
	capabilities = require("mason-lspconfig").capabilities,
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	single_file_support = true,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			runtime = {
				version = "LuaJIT",
			},
		},
	},
})

lspconfig.prettier.setup({
	on_attach = require("mason-lspconfig").on_attach,
	on_init = require("mason-lspconfig").on_init,
	capabilities = require("mason-lspconfig").capabilities,
	cmd = { "prettier" },
	filetypes = { "javascript", "typescript", "html", "css", "json" },
	single_file_support = true,
	settings = {
		prettier = {
			semi = true,
			singleQuote = true,
			trailingComma = "all",
		},
	},
})
