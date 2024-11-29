return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		"hrsh7th/cmp-buffer",
		"crazyhulk/cmp-sign",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind-nvim",
	},
	event = { "InsertEnter", "CmdlineEnter" },
	config = function()
		-- vim.opt.completeopt = { "menu", "menuone", "noselect" }
		vim.opt.shortmess:append("c")

		local lspkind = require("lspkind")
		lspkind.init({
			symbol_map = {
				Copilot = "",
			},
		})

		vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

		local kind_formatter = lspkind.cmp_format({
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
		})

		local cmp = require("cmp")
		local luasnip = require("luasnip")

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
				completeopt = "menu,menuone,noinsert",
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_document_symbol" },
				{ name = "luasnip" },
				{ name = "copilot" },
				{ name = "path" },
				{ name = "buffer", keyword_length = 2 },
				{ name = "emoji" },
			}),
		})

		cmp.setup.cmdline("/", {
			sources = cmp.config.sources({
				{ name = "nvim_lsp_document_symbol" },
			}, {
				{ name = "buffer" },
			}),
		})

		-- Setup for specific filetypes
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "cmp_git" },
			}, {
				{ name = "buffer" },
			}),
		})
	end,
}
