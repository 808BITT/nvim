-- local vim = vim
-- local api = vim.api
-- local M = {}
--
-- function M.nvim_create_augroups(definitions)
--     for group_name, definition in pairs(definitions) do
--         api.nvim_command('augroup '..group_name)
--         api.nvim_command('autocmd!')
--         for _, def in ipairs(definition) do
--             local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
--             api.nvim_command(command)
--         end
--         api.nvim_command('augroup END')
--     end
-- end
--
-- local autoCommands = {
--     -- other autocommands
--     open_folds = {
--         {"BufReadPost,FileReadPost", "*", "normal zR"}
--     }
-- }
--
-- M.nvim_create_augroups(autoCommands)


vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("no_newline_comment", { clear = true }),
    pattern = "*",
    command = "setlocal formatoptions-=cro",
    desc = "Disables automatic commenting on newline",
})

-- vim.api.nvim_create_autocmd({ "RecordingEnter" }, {
--   callback = function()
--                vim.opt.cmdheight = 1
--              end,
-- })
--
-- vim.api.nvim_create_autocmd({ "RecordingLeave" }, {
--   callback = function()
--                vim.opt.cmdheight = 0
--              end,
-- })
