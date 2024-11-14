-- Set leader key to space
vim.g.mapleader = " "

local telescope = require("telescope.builtin")
local map = vim.keymap.set
-- map(string, string, string, { desc = string })
-- Args: mode, keys, func, wk-tip

-- GLOBAL MAPPINGS
-- [*] leader key
map("n", "<leader>", "<nop>", { desc = "Leader" })



-- QUALITY OF LIFE
-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
-- paste over currently selected text without yanking it
map("v", "p", '"_dp')
map("v", "P", '"_dP')










-- SHORTCUTS




-- [*C] copilot
map("i", "<M-\\>", "<cmd>Copilot suggestion accept<cr>", { desc = "Accept Suggestion" })
--map("i", "<tab>", "<cmd>Copilot suggestion accept<cr>", { desc = "Accept Suggestion" })

-- [*F] file
map("n", "<leader>f", "<nop>", { desc = "File" })
map("n", "<leader>fs", "<cmd>write<cr>", { desc = "Save" })


-- [*J] jump
map("n", "<leader>j", "<nop>", { desc = "Jump" })
map("n", "<leader>jd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Definition" })
map("n", "<leader>jb", "<C-o>", { desc = "Back" })
map("n", "<leader>jn", "<C-i>", { desc = "Next" })


-- [L] lsp

-- [Q] quit
map("n", "<leader>q", "<nop>", { desc = "Quit/Close" })
map("n", "<leader>qq", "<cmd>quitall<cr>", { desc = "Quit" })
map("n", "<leader>qb", "<cmd>tabclose<cr>", { desc = "Close Tab" })


-- [S] search
map("n", "<leader>s", "<nop>", { desc = "Search" })
map("n", "<leader>sa", telescope.autocommands, { desc = "Commands"})
map("n", "<leader>sc", telescope.commands, { desc = "Commands"})
map("n", "<leader>sd", telescope.live_grep, { desc = "Directory" })
map("n", "<leader>sf", telescope.find_files, { desc = "Files" })
map("n", "<leader>sj", telescope.jumplist, { desc = "Jumps"})
map("n", "<leader>sk", telescope.keymaps, { desc = "Keymaps"})
map("n", "<leader>sg", telescope.git_files, { desc = "Git" })
map("n", "<leader>sh", telescope.command_history, { desc = "History" })
map("n", "<leader>sm", telescope.marks, { desc = "Marks" })
map("n", "<leader>ss", telescope.grep_string, { desc = "String (Cursor)" })


-- [T] tabs
map("n", "<leader>t", "<nop>", { desc = "Tabs" })
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New" })
map("n", "<leader>tb", "<cmd>tabprevious<cr>", { desc = "Previous" })
map("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "Next" })
map("n", "<leader>tB", "<cmd>-tabmove<cr>", { desc = "Move Left" })
map("n", "<leader>tN", "<cmd>+tabmove<cr>", { desc = "Move Right" })


-- [Z] spelling
map("n", "<leader>z", "<nop>", { desc = "Spelling" })
map("n", "<leader>zl", "<cmd>Telescope spell_suggest<cr>", { desc = "List corrections" })
map("n", "<leader>zf", "1z=", { desc = "Use first correction" })
map("n", "<leader>zj", "]s", { desc = "Next error" })
map("n", "<leader>zk", "[s", { desc = "Previous error" })
map("n", "<leader>za", "zg", { desc = "Add word" })



-- Additional leader key mappings not tied to Telescope
--map("n", "e", "<cmd>Neotree toggle<cr>", "Toggle File Explorer")
--map("n", "s", nil, "Split")
--map("n", "sh", "<C-w>s", "Horizontal Split")
--map("n", "sv", "<C-w>v", "Vertical Split")
