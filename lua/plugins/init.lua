-- plugins/init.lua
-- compile custom plugins to a single table for lazy
-- add plugin specs to ~/.config/nvim/lua/plugins/name.lua


-- local pluginname = require("plugins/pluginname")
local whichkey 		= require("plugins/whichkey")
local neodev 		= require("plugins/neodev")
local neoconf 		= require("plugins/neoconf")
local lspconfig		= require("plugins/lspconfig")


-- return the final table
return {
	whichkey,
	neodev,
	neoconf,
	lspconfig,
}

