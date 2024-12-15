return {
	"goolord/alpha-nvim",
	-- dependencies = { 'echasnovski/mini.icons' },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

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

		alpha.setup(dashboard.opts)

		vim.cmd([[
            autocmd FileType alpha setlocal nonumber norelativenumber nofoldenable
        ]])
	end,
}
