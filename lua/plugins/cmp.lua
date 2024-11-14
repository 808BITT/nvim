return {
	{
		"hrsh7th/nvim-cmp",
		setup = function()
			local cmp = require('cmp')
			cmp.setup {
				dependencies = {
					'hrsh7th/cmp-nvim-lsp',
					'zbirenbaum/copilot.lua',
					'zbirenbaum/copilot-cmp',
				},
				snippet = {
					expand = function(args)
						vim.fn['vsnip#anonymous'](args.body)
					end,
				},
				mapping = {
					['<Tab>'] = cmp.mapping.select_next_item(),
    					['<S-Tab>'] = cmp.mapping.select_prev_item(),
   					['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Accept selected item
				},
				sources = {
					{ name = 'copilot' },
					{ name = 'nvim_lsp' },
					{ name = 'vsnip' },
					{ name = 'buffer' },
				},
			}
		end,
	},
}
