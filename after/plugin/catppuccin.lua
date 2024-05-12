require("catppuccin").setup({
    lazy = false,
    flavour = "frappe",
    show_end_of_buffer = true,
    transparent_background = false,
    styles = {
        comments = {"italic"},
        conditionals = {"italic"},
    }
})

vim.cmd.colorscheme("catppuccin")
