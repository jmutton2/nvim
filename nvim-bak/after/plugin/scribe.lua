local ui = require("scribe.ui")

vim.keymap.set("n", "<leader>n", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>s", ui.save_cwd)
