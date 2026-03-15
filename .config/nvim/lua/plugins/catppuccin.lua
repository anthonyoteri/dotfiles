return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "mocha", -- Choose: latte, frappe, macchiato, mocha
            transparent_background = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                notify = true,
                mini = { enabled = true },
                navic = { enabled = true, custom_bg = "lualine" },
                telescope = true,
                which_key = true,
                -- Add other integrations as needed
            },
            dim_inactive = { enabled = false },
        },
    },
    { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin" } },
}
