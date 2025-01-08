local colors = {
	green = "#92e015",
	blue = "#1c6be2",
	cyan = "#38e1f7",
	black = "#101310",
	white = "#ffffff",
	red = "#e52b51",
	violet = "#b043f4",
	text = "#c7d1c9",
	grey = "#393c41",
}

local custom_theme = {
	normal = {
		a = { gui = "bold", fg = colors.black, bg = colors.green },
		b = { fg = colors.text },
		c = { fg = colors.text },
	},

	visual = { a = { gui = "bold", fg = colors.black, bg = colors.cyan } },
	replace = { a = { gui = "bold", fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.grey },
		b = { fg = colors.grey },
		c = { fg = colors.grey },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"navarasu/onedark.nvim",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = custom_theme,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			winbar = {
				-- lualine_a = {},
				lualine_a = {
					"tabs",
				},
				lualine_b = {},
				lualine_c = {
					{
						"buffers",
						show_filename_only = true, -- Shows shortened relative path when set to false.
						hide_filename_extension = false, -- Hide filename extension when set to true.
						show_modified_status = true, -- Shows indicator when the buffer is modified.
						mode = 0, -- 0: Shows buffer name
						max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
						filetype_names = {
							TelescopePrompt = "Telescope",
							dashboard = "Dashboard",
							packer = "Packer",
							fzf = "FZF",
							alpha = "Alpha",
						}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
						use_mode_colors = false,
						-- buffers_color = {
						-- 	active = { fg = "#FFFFFF" }, -- Color for active buffer
						-- 	inactive = { fg = "#505050" }, -- Color for inactive buffer
						-- },
						symbols = {
							modified = " ●", -- Text to show when the buffer is modified
							alternate_file = "", -- Text to show to identify the alternate file
							directory = "", -- Text to show when the buffer is a directory
						},
					},
				},
				-- lualine_x = { "os.date('%A, %b %d %Y %X')" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {},
			tabline = {},
			inactive_tabline = {},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{
						"filename",
						path = 1,
					},
					"diagnostics",
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				-- lualine_y = { "location", "progress" },
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {},
		})

		require("onedark").setup({
			style = "darker",
			transparent = true,
			colors = {
				black = "#26282c", -- color0
				grey = "#32353a",
				light_grey = "#d9d9d9", -- color7
				diff_text = "#26282c", -- color0
				fg = "#c7d1c9", -- foreground
				bg_d = "#101310", -- background
				bg0 = "#1f2329",
				bg1 = "#1A1B1E", -- tabline
				bg2 = "#30363f",
				bg3 = "#1A1B1E", -- b & x
				bg_blue = "#61afef",
				bg_yellow = "#e8c88c",
				orange = "#cc9057",
				dark_yellow = "#fab40f", -- color11
				yellow = "#fad682", -- color3
				dark_cyan = "#38e1f7", -- color14
				cyan = "#8aeaf7", -- color6
				dark_purple = "#b043f4", -- color13
				purple = "#c373f4", -- color5
				green = "#b2e068", -- color2
				diff_add = "#b2e068", -- color2
				dark_red = "#e52b51", -- color9
				red = "#fb6d89", -- color1
				diff_delete = "#fb6d89", -- color1
				blue = "#528ce2", -- color4
				diff_change = "#528ce2", -- color4
			},
			lualine = { transparent = true },
		})
		require("onedark").load()
	end,
}
