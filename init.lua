-- setup vim settings
require("config.settings")

-- bootstrap lazy and load ../lua/plugins
require("config.lazy")

-- setup mason and lsp settings
require("config.lsp")

-- setup autocommands
require("config.autocmds")

-- setup mappings
require("config.keymaps")
