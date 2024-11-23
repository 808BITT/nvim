-- setup vim settings
require("settings")

-- bootstrap lazy and load ../lua/plugins
require("config.lazy")

-- setup mason and lsp settings
require("config.lsp")

-- setup autocommands
require("config.autocommands")

-- setup mappings
<<<<<<< HEAD
require("config.mappings")
=======
require("mappings")

vim.cmd [[colorscheme moonfly]]
>>>>>>> main
