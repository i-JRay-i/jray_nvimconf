require("default.remap")
require("default.lazy")

-- Default number lines and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.incsearch = true

vim.opt.mouse = 'a'  -- Enabling mouse mode

vim.opt.showmode = true

-- Keeping Nvim and OS clipboards separate
-- vim.opt.clipbouard = 'unnamedplus'

vim.opt.breakindent = false  -- Disabling break indent
vim.opt.undofile = true  -- Saving undo file history

vim.opt.ignorecase = false -- Case-sensitive search
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250 -- Update time (ms)
vim.opt.timeoutlen = 300 -- Mapped sequence wait time (ms)

-- Configuration for screen split
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = "split"
vim.opt.cursorline = true

vim.opt.scrolloff = 10  -- Minimum number of lines to keep above/below the cursor

-- Basic Keymaps
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')


vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
