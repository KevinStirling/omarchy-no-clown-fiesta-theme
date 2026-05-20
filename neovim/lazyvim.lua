return {
    {
        "aktersnurra/no-clown-fiesta.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            -- optional: customize settings here
            -- transparent = false,
            -- styles = {
            --   comments = { italic = true },
            --   keywords = { bold = true },
            -- },
        },
        config = function(_, opts)
            require("no-clown-fiesta").setup(opts)
            vim.cmd.colorscheme("no-clown-fiesta")
        end,
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "no-clown-fiesta",
        },
    },
}
