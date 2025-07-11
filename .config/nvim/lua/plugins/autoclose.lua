return {
    "m4xshen/autoclose.nvim",
    config = function()
        local config = {
            keys = {
                ["("] = { escape = false, close = true, pair = "()" },
                ["["] = { escape = false, close = true, pair = "[]" },
                ["{"] = { escape = false, close = true, pair = "{}" },

                [">"] = { escape = true, close = false, pair = "<>" },
                [")"] = { escape = true, close = false, pair = "()" },
                ["]"] = { escape = true, close = false, pair = "[]" },
                ["}"] = { escape = true, close = false, pair = "{}" },

                ['"'] = { escape = true, close = true, pair = '""' },
                ["'"] = { escape = true, close = true, pair = "''" },
                ["`"] = { escape = true, close = true, pair = "``" },
            },
            options = {
                disabled_filetypes = { "text", "gitcomit" },
                disable_when_touch = true,
                touch_regex = "[%w(%[{]",
                pair_spaces = true,
                auto_indent = true,
            },
        }
        require("autoclose").setup(config)
    end,
}
