local map = vim.keymap.set
-- map(mode, keys, command, { desc = string })

local telescope = require("telescope.builtin")


-- MAPPINGS
-- [*] leader key
map("n", "<leader>", "<nop>", { desc = "Leader" })

-- [*A] actions
map("n", "<leader>a", "<nop>", { desc = "Actions" })
map("n", "<leader>aa", "<cmd>Telescope lsp_code_actions<cr>", { desc = "Code Actions" })

-- [*B] buffer
map("n", "<leader>b", "<nop>", { desc = "Buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete" })
map("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next" })
map("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Previous" })
map("n", "<leader>bs", "<cmd>Telescope buffers<cr>", { desc = "Switch" })

-- [*C] copilot
map("i", "<c-\\>", "<cmd>Copilot suggestion accept<cr>", { desc = "Accept Suggestion" })
--map("i", "<tab>", "<cmd>Copilot suggestion accept<cr>", { desc = "Accept Suggestion" })

-- [*D] debug
map("n", "<leader>d", "<nop>", { desc = "Debug" })
map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", { desc = "Continue" })
map("n", "<leader>dd", "<cmd>lua require('dap').step_over()<cr>", { desc = "Step Over" })

-- [*E] edit
map("n", "<leader>e", "<nop>", { desc = "Edit" })
map("n", "<leader>ev", "<cmd>edit $MYVIMRC<cr>", { desc = "Vimrc" })
map("n", "<leader>em", "<cmd>edit $MYLUA/keybindings.lua<cr>", { desc = "Keybindings" })

-- [*F] file
map("n", "<leader>f", "<nop>", { desc = "File" })
map("n", "<leader>fs", "<cmd>write<cr>", { desc = "Save" })

-- [*G] git
map("n", "<leader>g", "<nop>", { desc = "Git" })
map("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Status" })
map("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Commit" })
map("n", "<leader>gp", "<cmd>Git push<cr>", { desc = "Push" })

-- [*H] help
map("n", "<leader>h", "<nop>", { desc = "Help" })
map("n", "<leader>hv", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover" })
map("n", "<leader>hd", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Signature" })

-- [*I]

-- [*J] jump
map("n", "<leader>j", "<nop>", { desc = "Jump" })
map("n", "<leader>jd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Definition" })
map("n", "<leader>jb", "<C-o>", { desc = "Back" })
map("n", "<leader>jn", "<C-i>", { desc = "Next" })
map("n", "<leader>ji", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Implementation" })
map("n", "<leader>jr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "References" })

-- [*K] keep

-- [*L] 
-- [*M] make
-- [*N] notes
-- [*Q] quit
map("n", "<leader>q", "<nop>", { desc = "Quit/Close" })
map("n", "<leader>qq", "<cmd>quitall<cr>", { desc = "Quit" })
map("n", "<leader>qb", "<cmd>tabclose<cr>", { desc = "Close Tab" })


-- [*S] search
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


-- [*T] tabs
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

