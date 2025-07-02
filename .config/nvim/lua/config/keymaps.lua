vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- paste from system clipboard by default
vim.keymap.set("n", "p", '"+p')
vim.keymap.set("n", "P", '"+P')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Primeagen remaps
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "[V]iew [D]iagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

---@param jumpCount number
local function jumpWithVirtLineDiags(jumpCount)
    pcall(vim.api.nvim_del_augroup_by_name, "jumpWithVirtLineDiags") -- prevent autocmd for repeated jumps

    vim.diagnostic.jump { count = jumpCount }

    local initialVirtTextConf = vim.diagnostic.config().virtual_text
    vim.diagnostic.config {
        virtual_text = false,
        virtual_lines = { current_line = true },
    }

    vim.defer_fn(function() -- deferred to not trigger by jump itself
        vim.api.nvim_create_autocmd("CursorMoved", {
            desc = "User(once): Reset diagnostics virtual lines",
            once = true,
            group = vim.api.nvim_create_augroup("jumpWithVirtLineDiags", {}),
            callback = function()
                vim.diagnostic.config { virtual_lines = false, virtual_text = initialVirtTextConf }
            end,
        })
    end, 1)
end

-- Set highlight on search, but clear on pressing <Esc> in normal mode
-- vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
