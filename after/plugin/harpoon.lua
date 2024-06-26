local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.navfile(1) end)
vim.keymap.set("n", "<C-t>", function() ui.navfile(2) end)
vim.keymap.set("n", "<C-n>", function() ui.navfile(3) end)
vim.keymap.set("n", "<C-s>", function() ui.navfile(4) end)
