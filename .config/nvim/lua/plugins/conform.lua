-- Autoformat
return {
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format { async = true, lsp_fallback = true }
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
    formatters = {
        stylua = {
            args = { "--config-path", "~/.config/stylua/config.toml" },
        },
    },
    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            -- Disable "format_on_save lsp_fallback" for languages that don't
            -- have a well standardized coding style. You can add additional
            -- languages here or re-enable it for the disabled ones.
            local disable_filetypes = { c = false, cpp = false }
            return {
                timeout_ms = 500,
                lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
            }
        end,
        formatters_by_ft = {
            lua = { "stylua" },
            sql = { "sqlfmt" },
            rust = { "rustfmt" },
            javascript = { "prettier" },
            json = { "prettier" },
            markdown = { "prettier" },
            typescript = { "prettier" },
            svelte = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            java = { "prettier" },
            -- Conform can also run multiple formatters sequentially
            -- python = { "isort", "black" },
            --
            -- You can use a sub-list to tell conform to run *until* a formatter
            -- is found.
            -- javascript = { { "prettierd", "prettier" } },
        },
    },
}
