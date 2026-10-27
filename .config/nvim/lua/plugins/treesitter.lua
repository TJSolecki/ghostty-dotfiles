vim.api.nvim_create_autocmd("User", {
    pattern = "TSUpdate",
    callback = function()
        require("nvim-treesitter.parsers").lox = {
            install_info = {
                url = "https://github.com/ajeetdsouza/tree-sitter-lox",
            },
        }
    end,
})

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local bufnr = args.buf
                -- Ruby relies on Vim's regex highlighting/indent rules.
                if vim.bo[bufnr].filetype == "ruby" then
                    return
                end
                local ok = pcall(vim.treesitter.start, bufnr)
                if ok then
                    vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
