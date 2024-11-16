-- lua/config/cmp.lua
local M = {}

function M.setup()
	vim.opt.completeopt = { "menu", "menuone", "noselect" }
	vim.opt.shortmess:append "c"

	local lspkind = require "lspkind"
	lspkind.init {
		symbol_map = {
			Copilot = "",
		},
	}

	vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

	local kind_formatter = lspkind.cmp_format {
		mode = "symbol_text",
		maxwidth = {
			menu = 50,
			abbr = 50,
		},
		menu = {
			buffer = "[buf]",
			nvim_lsp = "[LSP]",
			nvim_lua = "[api]",
			path = "[path]",
			luasnip = "[snip]",
		},
	}


	local cmp = require('cmp')
	local luasnip = require('luasnip')

	cmp.setup({
		formatting = {
			format = kind_formatter,
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = {
			["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
			["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
			["<C-y>"] = cmp.mapping(cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}, { "i", "c" }),
		},
		completion = {
		    completeopt = 'menu,menuone,noinsert',
		},
		sources = cmp.config.sources({
			{ name = 'copilot' },
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = 'path' },
			{ name = 'buffer' },
		}),
		})

		-- Setup for specific filetypes
		cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
		    { name = 'cmp_git' },
		}, {
		    { name = 'buffer' },
		}),
		})

		-- Setup for command-line mode
		cmp.setup.cmdline('/', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
		    { name = 'buffer' },
		},
		})

		cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
		    { name = 'path' },
		}, {
		    { name = 'cmdline' },
		}),
	})
end

return M

