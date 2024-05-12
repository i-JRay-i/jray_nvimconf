local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require("cmp")
local luasnip = require('luasnip')

luasnip.config.setup {}
cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    completion = { completeopt = 'menu,menuone,noinsert' },
    mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),  -- Select the [n]ext item
        ['<C-p>'] = cmp.mapping.select_prev_item(),  -- Select the [p]revious item
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),  -- Scroll the documentation window [b]ackward
        ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- Scroll the documentation window [f]orward
        ['<C-e>'] = cmp.mapping.close(), -- [c]lose the window
        ['<C-y>'] = cmp.mapping.confirm { select = true }, -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
        ['<C-Space>'] = cmp.mapping.complete {}, -- Manually trigger a completion from nvim-cmp.
        ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            end
        end, { 'i', 's' }),
	    ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    },
    {{name = 'buffer'},},
}

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

require("mason-lspconfig").setup{
    ensure_installed = {"lua_ls", "clangd", "gopls", "pyright"},
}
