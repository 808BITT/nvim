return {
	"goolord/alpha-nvim",
	-- dependencies = { 'echasnovski/mini.icons' },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		dashboard.section.buttons.val = {
			dashboard.button("r", "󰥔  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("g", "󰊢  > NeoGit", ":Neogit<CR>"),
			dashboard.button("k", "󰌌  > Keymaps", ":Telescope keymaps<CR>"),
			dashboard.button("l", "󱐥  > Lazy Plugins", ":Lazy<cr>"),
			dashboard.button("q", "󱎘  > Quit", ":qa<CR>"),
		}

		dashboard.section.footer.val = "I'll think of something cool to put here later."
		dashboard.section.footer.opts = {
			position = "center",
			hl = "AlphaFooter",
		}

		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#92e015" })
		vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#92e015" })

		alpha.setup(dashboard.opts)
		vim.cmd([[
            autocmd FileType alpha setlocal nonumber norelativenumber nofoldenable
        ]])
	end,
}
