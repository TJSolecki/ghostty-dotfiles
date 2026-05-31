vim.api.nvim_create_autocmd("User", {
    pattern = "TSUpdate",
    callback = function()
        local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
        parser_configs.lox = {
            install_info = {
                url = "https://github.com/ajeetdsouza/tree-sitter-lox",
                files = { "src/parser.c", "src/scanner.c" },
            },
        }
        parser_configs.gleam = {
            install_info = {
                url = "https://github.com/gleam-lang/tree-sitter-gleam",
                files = { "src/parser.c", "src/scanner.c" },
                revision = "dae1551a9911b24f41d876c23f2ab05ece0a9d4c",
            },
        }
    end,
})

return { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = {
            enable = true,
            -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
            --  If you are experiencing weird indenting issues, add the language to
            --  the list of additional_vim_regex_highlighting and disabled languages for indent.
            additional_vim_regex_highlighting = { "ruby" },
        },
        indent = { enable = true, disable = { "ruby" } },
    },
    config = function(_, opts)
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

        -- Prefer git instead of curl in order to improve connectivity in some environments
        require("nvim-treesitter.install").prefer_git = true
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup(opts)

        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
}
