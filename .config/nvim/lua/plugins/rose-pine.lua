return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
        require("rose-pine").setup {
            --- @usage 'auto'|'main'|'moon'|'dawn'
            variant = "main",
            --- @usage 'main'|'moon'|'dawn'
            dark_variant = "main",
            bold_vert_split = false,
            dim_nc_background = false,
            disable_background = true,
            disable_float_background = true,
            disable_italics = false,

            --- @usage string hex value or named color from rosepinetheme.com/palette
            groups = {
                background = "none",
                background_nc = "_experimental_nc",
                panel = "surface",
                panel_nc = "base",
                border = "highlight_med",
                comment = "muted",
                link = "iris",
                punctuation = "subtle",

                error = "love",
                hint = "iris",
                info = "foam",
                warn = "gold",

                headings = {
                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },
                -- or set all headings at once
                -- headings = 'subtle'
            },

            -- Change specific vim highlight groups
            -- https://github.com/rose-pine/neovim/wiki/Recipes
            highlight_groups = {
                ColorColumn = { bg = "rose" },

                -- Blend colours against the "base" background
                CursorLine = { bg = "rose", blend = 10 },
                StatusLine = { fg = "rose", bg = "rose", blend = 10 },

                -- By default each group adds to the existing config.
                -- If you only want to set what is written in this config exactly,
                -- you can set the inherit option:
                Search = { bg = "gold", inherit = false },
            },
        }
    end,
    init = function()
        -- Load the colorscheme here.
        -- Like many other themes, this one has different styles, and you could load
        -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.

        vim.cmd.colorscheme "rose-pine"

        -- You can configure highlights by doing something like:
        vim.cmd.hi "Comment gui=none"
        -- vim.cmd.hi 'Comment gui=none'
    end,
}
