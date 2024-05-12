require('telescope').setup {
    extensions = {['ui-select'] = {
        require('telescope.themes').get_dropdown(),},
    },
}

-- Enable Telescope extensions if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>sf', builtin.find_files, {desc = "[s]earch [f]iles"})
vim.keymap.set('n', '<leader>sk', builtin.keymaps, {desc = "[s]earch [k]eymaps"})
vim.keymap.set('n', '<leader>sw', builtin.grep_string, {desc = "[s]earch [w]ord"})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {desc = "[s]earch by [g]rep"})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {desc = "[s]earch existing [b]uffers"})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {desc = "[s]earch [h]elp"})

vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
}) end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    -- See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
    builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
} end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })
