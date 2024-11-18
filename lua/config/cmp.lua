-- lua/config/cmp.lua
local M = {}

function M.setup()
	-- vim.opt.completeopt = { "menu", "menuone", "noselect" }
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
		completion = {
		    completeopt = 'menu,menuone,noinsert',
		},
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
            { name = 'nvim_lsp_document_symbol' },
			{ name = 'luasnip' },
			{ name = 'copilot' },
			{ name = 'path' },
			{ name = 'buffer', keyword_length = 3 },
            { name = 'emoji' },
		}),
	})

    cmp.setup.cmdline('/', {
        sources = cmp.config.sources({
            { name = 'nvim_lsp_document_symbol' },
        }, {
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
    end

return M

