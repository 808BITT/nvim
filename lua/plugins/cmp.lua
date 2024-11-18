return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lsp-document-symbol',
        'hrsh7th/cmp-buffer',
        'crazyhulk/cmp-sign',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
		'onsails/lspkind-nvim',
	},
	event = {"InsertEnter", "CmdlineEnter"},
    config = function()
		require('config.cmp').setup()
	end,
}
