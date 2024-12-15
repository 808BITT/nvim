local telescope = require("telescope.builtin")
local luasnip = require("luasnip")
local cmp = require("cmp")
local map = vim.keymap.set

-- COMPLETION
-- ins = type and <tab> to cycle options, <cr> selects the highlighted option
-- ':' = type and <tab> to select, <cr> is left to execute the command
-- both modes use <esc> to close the completion menu
cmp.setup({
	mapping = {
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if luasnip.expandable() then
					luasnip.expand()
				else
					cmp.confirm({
						select = true,
					})
				end
			else
				fallback()
			end
		end),
		["<esc>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.close()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
})
cmp.setup.cmdline(":", {
	-- mapping = cmp.mapping({
	-- 	["<tab>"] = cmp.mapping(function(fallback)
	-- 		if cmp.visible() then
	-- 			cmp.confirm({
	-- 				select = true,
	-- 				behavior = cmp.ConfirmBehavior.Replace,
	-- 			})
	-- 		else
	-- 			fallback()
	-- 		end
	-- 	end, { "c" }),
	-- }),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- jj to go back to normal mode (not sure i like the visual delay it causes when i type j and i dont really remember to use it)
-- map("i", "jj", "<esc>", { desc = "Normal Mode" })

-- control-s to save
map("i", "<c-s>", "<esc><cmd>w<cr>a", { desc = "Save Buffer" })
map("n", "<c-s>", "<esc><cmd>w<cr>", { desc = "Save Buffer" })

-- go err check shortcut
map("i", "<m-e>", "if err != nil {<cr>}<esc>O", { desc = "Go Error Check" })

-- quit shortcut
map("n", "<c-q>", "<cmd>wqa<cr>", { desc = "Save and Quit" })
map("n", "<m-q>", "<cmd>qall!<cr>", { desc = "Quit All" })

--
map("n", "<c-f>", telescope.git_files, { desc = "Git Files" })
map("n", "<c-g>", "<cmd>Neogit<cr>", { desc = "Git" })

-- no whichkey
map("n", "<leader>", "<nop>", { desc = "Leader" })
map("n", "<leader><space>", "<cmd>noh<cr><esc>", { desc = "Clear Highlights" })
map("n", "<leader>;", "<cmd>Telescope commands<cr>", { desc = "Search Commands" })
map("n", "<leader><tab>", "<cmd>Neotree toggle<cr>", { desc = "File Browser" })
map("n", "<leader>.", "<cmd>Telescope file_browser<cr>", { desc = "File Browser" })
map("n", "<leader>?", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
map("n", "<leader><esc>", "<cmd>Alpha<cr>", { desc = "Alpha" })
-- B
map("n", "<leader>b", "<nop>", { desc = "Buffers" })
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Show Buffers" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- D
map("n", "<leader>d", "<nop>", { desc = "Debug" })
map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", { desc = "Continue" })
map("n", "<leader>dd", "<cmd>lua require('dap').step_over()<cr>", { desc = "Step Over" })
-- E
map("n", "<leader>em", "<cmd>edit ~/.config/nvim/lua/mappings.lua<cr>", { desc = "Edit Mappings" })
-- F
-- J
map("n", "<leader>j", "<nop>", { desc = "Jump" })
map("n", "<leader>jd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Jump to Definition" })
map("n", "<leader>jb", "<C-o>", { desc = "Jump Back" })
map("n", "<leader>jn", "<C-i>", { desc = "Jump Next" })
map("n", "<leader>ji", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Jump to Implementation" })
map("n", "<leader>jr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Jump to References" })
-- H
map("n", "<leader>h", "<nop>", { desc = "Help" })
map("n", "<leader>hv", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover" })
map("n", "<leader>hd", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Signature" })
-- L
map("n", "<leader>l", "<nop>", { desc = "Lazy" })
map("n", "<leader>ls", "<cmd>edit ~/.config/nvim/lua/config/lazy.lua<cr>", { desc = "Edit Lazy Settings" })
map("n", "<leader>lu", "<cmd>Lazy update<cr>", { desc = "Update" })
map("n", "<leader>lx", "<cmd>Lazy clean<cr>", { desc = "Clean" })
-- Q
map("n", "<leader>q", "<nop>", { desc = "Quit/Close" })
map("n", "<leader>qq", "<cmd>quitall<cr>", { desc = "Quit" })
map("n", "<leader>qb", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- R
map("n", "<leader>r", "<nop>", { desc = "Settings" })
map("n", "<leader>rn", "<cmd>IncRename ", { desc = "Rename" })
-- S
map("n", "<leader>s", telescope.grep_string, { desc = "Search Under Cursor" })
-- T
map("n", "<leader>ta", telescope.autocommands, { desc = "Search AutoCommands" })
map("n", "<leader>tb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "File Explorer" })
map("n", "<leader>tc", telescope.commands, { desc = "Search Commands" })
map("n", "<leader>td", telescope.live_grep, { desc = "Grep Current Directory" })
map("n", "<leader>tf", "<cmd>Telescope find_files cwd=~/projects hidden=true theme=ivy<cr>", { desc = "Find Files" })
map("n", "<leader>tg", telescope.git_files, { desc = "Git Files" })
map("n", "<leader>th", telescope.command_history, { desc = "Command History" })
map("n", "<leader>tj", telescope.jumplist, { desc = "Search Jumps" })
map("n", "<leader>tk", telescope.keymaps, { desc = "Search Keymaps" })
map("n", "<leader>tm", telescope.marks, { desc = "Search Marks" })
-- Z
map("n", "<leader>z", "<cmd>Telescope zoxide list<cr>", { desc = "Change Directory" })

--  ███╗   ██╗ █████╗ ██╗   ██╗██╗ ██████╗  █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
--  ████╗  ██║██╔══██╗██║   ██║██║██╔════╝ ██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
--  ██╔██╗ ██║███████║██║   ██║██║██║  ███╗███████║   ██║   ██║██║   ██║██╔██╗ ██║
--  ██║╚██╗██║██╔══██║╚██╗ ██╔╝██║██║   ██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
--  ██║ ╚████║██║  ██║ ╚████╔╝ ██║╚██████╔╝██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
--  ╚═╝  ╚═══╝╚═╝  ╚═╝  ╚═══╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
-- https://patorjk.com/software/taag/#p=display&c=bash&f=ANSI%20Shadow&t=Shell%0A

-- Remap for dealing with splits
map("n", "<c-j>", "<c-w><c-j>")
map("n", "<c-k>", "<c-w><c-k>")
map("n", "<c-l>", "<c-w><c-l>")
map("n", "<c-h>", "<c-w><c-h>")

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<", "<<")
map("n", ">", ">>")

-- paste over currently selected text without yanking it
map("v", "p", '"_dp')
map("v", "P", '"_dP')
