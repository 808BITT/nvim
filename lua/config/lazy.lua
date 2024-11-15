-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" }, -- .config/nvim/lua/plugins/init.lua
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Gotta come before Mason
require("neoconf").setup({
  -- override any of the default settings here
})

-- Setup Mason
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
})

-- Custom LSP settings here
-- After setting up mason-lspconfig you may set up servers via lspconfig
--
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
          			version = "LuaJIT",
          			path = vim.split(package.path, ";"),
        		},
        		diagnostics = {
          			globals = { "vim" },
        		},
        		workspace = {
          			library = { vim.env.VIMRUNTIME },
          			checkThirdParty = false,
        		},
        		telemetry = {
          			enable = false,
  			},
		},
	},
})
-- require("lspconfig").rust_analyzer.setup {}
lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.ts_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
