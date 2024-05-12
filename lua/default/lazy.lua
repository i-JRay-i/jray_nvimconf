-- Lazy Plug-in Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plug-in Setup for Lazy
require("lazy").setup({
    -- Telescope
    { "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        branch = "0.1.x",
        dependencies={"nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim"},
    },

    -- Catppuccin
    { "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    -- LuaLine
    {"nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Treesitter
    {"nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    -- Useful plugin to show you pending keybinds.
    {"folke/which-key.nvim",
        event = 'VimEnter', -- Sets the loading event to 'VimEnter'
        config = function() -- This is the function that runs, AFTER loading
            require('which-key').setup()

        -- Document existing key chains
            require('which-key').register {
                ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
                ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
                ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
                ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
                ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
                ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
                ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
            }

            -- visual mode
            require('which-key').register({
                ['<leader>h'] = { 'Git [H]unk' },
            }, { mode = 'v' })
        end,
    },

    -- LSP Configuration
    {"neovim/nvim-lspconfig",
        dependencies = {
	    {"williamboman/mason.nvim",
                config = true},
	    {"williamboman/mason-lspconfig.nvim"},
	    {"WhoIsSethDaniel/mason-tool-installer.nvim"},
            { "j-hui/fidget.nvim", opts = {} },
            { "folke/neodev.nvim", opts = {} },
	},

    },

    -- Harpoon
    {"theprimeagen/harpoon"},

    -- Undotree
    {"mbbill/undotree"},

    -- lsp-zero
    {'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x'},

    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-cmdline"},

    {"L3MON4D3/LuaSnip",
        build = (function()
            if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                return
            end
                return 'make install_jsregexp'
            end)(),
                dependencies = {},
    },
    {"saadparwaiz1/cmp_luasnip"},

    -- TAB Autocompletion tool for Neovim
    {"hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {},
    },
})

