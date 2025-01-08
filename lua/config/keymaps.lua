local telescope = require("telescope.builtin")
local luasnip = require("luasnip")
local cmp = require("cmp")
local map = vim.keymap.set

-- "Snippets"
-- go: err check
map("i", "<m-e>", "if err != nil {<cr>}<esc>O")

-- COMPLETION MAPPINGS
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

-- \ to open file browser
map("n", "\\", "<cmd>Telescope file_browser<cr>", { desc = "File Browser" })

-- ctrl-s to save current buffer
map({ "i", "n" }, "<c-s>", "<esc><cmd>w<cr>", { desc = "Save Buffer" })

-- ctrl-q to save and quit all buffers
map("n", "<c-q>", "<cmd>wqa<cr>", { desc = "Save and Quit" })

-- ctrl-f to find files in current git repo
map({ "n", "i" }, "<c-f>", "<cmd>Telescope git_files hidden=false<CR>")

-- ctrl-g to open neogit
map("n", "<c-g>", "<cmd>Neogit<cr>", { desc = "Git" })

-- jj to exit insert mode
map("i", "jj", "<esc>")

-- buffer navigation
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<s-tab>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "<leader><space>", "<cmd>blast<cr>")
map("n", "<leader><esc>", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
map("n", "<leader><tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><s-tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- copilot
map("n", "<leader>ce", "<cmd>Copilot enable<cr>", { desc = "Copilot Enable" })
map("n", "<leader>cd", "<cmd>Copilot disable<cr>", { desc = "Copilot Disable" })

-- debugging (dap)
map("n", "<leader>d", "<nop>", { desc = "Debug" })
map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", { desc = "Continue" })
map("n", "<leader>dd", "<cmd>lua require('dap').step_over()<cr>", { desc = "Step Over" })

-- F
map("n", "<leader>f", "<nop>", { desc = "Find" })
map("n", "<leader>f?", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })
map("n", "<leader>fa", telescope.autocommands, { desc = "Find AutoCommand" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffer" })
map("n", "<leader>fc", telescope.commands, { desc = "Search Commands" })
map("n", "<leader>fd", telescope.live_grep, { desc = "Grep Current Directory" })
map(
	"n",
	"<leader>ffc",
	"<cmd>Telescope find_files cwd=~/dotfiles hidden=true theme=ivy<cr>",
	{ desc = "Find Config File" }
)
map(
	"n",
	"<leader>ffp",
	"<cmd>Telescope find_files cwd=~/projects hidden=true theme=ivy<cr>",
	{ desc = "Find File in Projects" }
)
map(
	"n",
	"<leader>ffg",
	"<cmd>Telescope find_files cwd=~/projects hidden=true theme=ivy<cr>",
	{ desc = "Find File in Projects" }
)
map("n", "<leader>fg", telescope.git_files, { desc = "Find File in Git" })
map("n", "<leader>fh", telescope.command_history, { desc = "Find Previous Command" })
map("n", "<leader>fj", telescope.jumplist, { desc = "Search Jumps" })
map("n", "<leader>fk", telescope.keymaps, { desc = "Search Keymaps" })
map("n", "<leader>fm", telescope.marks, { desc = "Search Marks" })

-- go to
map("n", "<leader>g", "<nop>", { desc = "Go (to)" })
map("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to Definition" })
map("n", "<leader>gb", "<C-o>", { desc = "Go Back a Jump" })
map("n", "<leader>gn", "<C-i>", { desc = "Go to Next Jump" })
map("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Go to Implementations" })
map("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Go to References" })

-- help
map("i", "<c-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Signature Help" })
map("n", "<leader>h", "<nop>", { desc = "Help" })
map("n", "<leader>hh", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover Help" })
map("n", "<leader>hd", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Signature Help" })
-- L
map("n", "<leader>l", "<nop>", { desc = "Lazy" })
map("n", "<leader>ls", "<cmd>edit ~/.config/nvim/lua/config/lazy.lua<cr>", { desc = "Edit Lazy Settings" })
map("n", "<leader>lu", "<cmd>Lazy update<cr>", { desc = "Update" })
map("n", "<leader>lx", "<cmd>Lazy clean<cr>", { desc = "Clean" })
-- Q
map("n", "<leader>qq", "<cmd>quitall<cr>", { desc = "Quit" })
map("n", "<leader>qb", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- R
map("n", "<leader>rn", ":IncRename ", { desc = "Rename" })
-- S
map("n", "<leader>s", telescope.grep_string, { desc = "Search Under Cursor" })
-- T
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
