-- load options (vim.opt settings)
require("config.options")

-- load keymaps (leader must be set before lazy)
require("config.keymaps")

-- bootstrap and load all plugins
require("config.lazy")
