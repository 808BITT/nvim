local luasnip = require("luasnip")
local cmp = require("cmp")
local vim = vim
cmp.setup {
    mapping = {
        ['<S-CR>'] = cmp.mapping(function(fallback)
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
        ['<esc>'] = cmp.mapping(function(fallback)
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
        end, { "i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s"}),
    },
}

local map = vim.keymap.set
-- map(mode, keys, command, { desc = string })

-- MAPPINGS
map("i", "jj", "<esc>", { desc = "Escape" })
map("i", "<c-s>", "<esc><cmd>w<cr>", { desc = "Escape" })
map("n", "<tab>", "<cmd>bn<cr>", { desc = "Next Buffer" })
map("n", "<s-tab>", "<cmd>bp<cr>", { desc = "Previous Buffer" })
map("n", "<c-s>", "<cmd>w<cr>", { desc = "Save" })
map("n", "<c-q>", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<c-f>", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<c-g>", "<cmd>Neogit<cr>", { desc = "Git" })
map("n", "<c-h>", "<cmd>Telescope help_tags<cr>", { desc = "Help" })


-- [*] leader key
map("n", "<leader>", "<nop>", { desc = "Leader" })
map("n", "<leader><space>", "<cmd>noh<cr>", { desc = "Clear Highlights" })
map("n", "<leader>;", "<cmd>Telescope commands<cr>", { desc = "Commands" })

-- [*A] actions
map("n", "<leader>a", "<nop>", { desc = "Actions" })
map("n", "<leader>aa", "<cmd>Telescope lsp_code_actions<cr>", { desc = "Code Actions" })

-- [*B] buffer
map("n", "<leader>b", "<nop>", { desc = "Buffer" })
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Show Buffers" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })
map("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next Buffer" })
map("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Prev Buffer" })

-- [*C] copilot
map("i", "<c-\\>", "<cmd>Copilot suggestion accept<cr>", { desc = "Accept Suggestion" })
--map("i", "<tab>", "<cmd>Copilot suggestion accept<cr>", { desc = "Accept Suggestion" })

-- [*D] debug
map("n", "<leader>d", "<nop>", { desc = "Debug" })
map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", { desc = "Continue" })
map("n", "<leader>dd", "<cmd>lua require('dap').step_over()<cr>", { desc = "Step Over" })

-- [*E] 

-- [*F] find
local telescope = require("telescope.builtin")
map("n", "<leader>f", "<nop>", { desc = "Find" })
map("n", "<leader>fa", telescope.autocommands, { desc = "Search AutoCommands"})
map("n", "<leader>fc", telescope.commands, { desc = "Search Commands"})
map("n", "<leader>fd", telescope.live_grep, { desc = "Grep Current Directory" })
map("n", "<leader>ff", "<cmd>Neotree toggle<cr>", { desc = "File Browser" })
map("n", "<leader>fg", telescope.git_files, { desc = "Git Files" })
map("n", "<leader>fh", telescope.command_history, { desc = "Command History" })
map("n", "<leader>fj", telescope.jumplist, { desc = "Search Jumps"})
map("n", "<leader>fk", telescope.keymaps, { desc = "Search Keymaps"})
map("n", "<leader>fm", telescope.marks, { desc = "Search Marks" })
map("n", "<leader>fs", telescope.grep_string, { desc = "Search Cursor" })

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

-- [*S] settings
map("n", "<leader>s", "<nop>", { desc = "Settings" })	
map("n", "<leader>sl", "<cmd>edit ~/.config/nvim/lua/config/lazy.lua<cr>", { desc = "Lazy Settings" })
map("n", "<leader>sc", "<cmd>edit ~/.config/nvim/lua/config/cmp.lua<cr>", { desc = "Edit Completion Settings" })
map("n", "<leader>ss", "<cmd>edit ~/.config/nvim/lua/settings.lua<cr>", { desc = "Edit Vimrc Settings" })
map("n", "<leader>sm", "<cmd>edit ~/.config/nvim/lua/mappings.lua<cr>", { desc = "Edit Mappings" })
map("n", "<leader>st", "<cmd>edit ~/.config/nvim/lua/plugins/theme.lua<cr>", { desc = "Edit Mappings" })

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





--  ███╗   ██╗ █████╗ ██╗   ██╗██╗ ██████╗  █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
--  ████╗  ██║██╔══██╗██║   ██║██║██╔════╝ ██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
--  ██╔██╗ ██║███████║██║   ██║██║██║  ███╗███████║   ██║   ██║██║   ██║██╔██╗ ██║
--  ██║╚██╗██║██╔══██║╚██╗ ██╔╝██║██║   ██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
--  ██║ ╚████║██║  ██║ ╚████╔╝ ██║╚██████╔╝██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
--  ╚═╝  ╚═══╝╚═╝  ╚═╝  ╚═══╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
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

