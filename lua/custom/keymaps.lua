-- lua/custom/keymaps.lua

local opts = { noremap = true, silent = true }

-- Git Keymaps
vim.keymap.set('n', '<leader>gl', '<cmd>LazyGit<cr>', { desc = '[G]it [L]azyGit' })
vim.keymap.set('n', '<leader>gb', '<cmd>Gbrowse<cr>', { desc = '[G]it [B]rowse' })
-- Harpoon
-- In lua/custom/keymaps.lua

local harpoon = require 'harpoon'

-- Harpoon
vim.keymap.set('n', '<leader>ha', function()
  harpoon:list():add()
end, { desc = 'Harpoon add file' })
vim.keymap.set('n', '<leader>h1', function()
  harpoon:list():select(1)
end, { desc = 'Harpoon to file 1' })
vim.keymap.set('n', '<leader>h2', function()
  harpoon:list():select(2)
end, { desc = 'Harpoon to file 2' })
vim.keymap.set('n', '<leader>h3', function()
  harpoon:list():select(3)
end, { desc = 'Harpoon to file 3' })
vim.keymap.set('n', '<leader>h4', function()
  harpoon:list():select(4)
end, { desc = 'Harpoon to file 4' })

-- Visual mode: move block
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

-- In visual mode, paste over the selected text without
-- overwriting the unnamed register (yank buffer).
-- This lets you paste the same text repeatedly without losing it,
-- because the replaced text is deleted into the black hole register ("_).
vim.keymap.set('x', '<leader>p', [["_dP"]], { desc = 'Paste and leave on buffer' })
-- prevent x delete from registering when next paste
vim.keymap.set("n", "x", '"_x', opts)

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true

vim.keymap.set("n", "<leader>tl", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible,
        signs = isLspDiagnosticsVisible and true or false,
        update_in_insert = false,
    })
    if isLspDiagnosticsVisible then
        vim.diagnostic.open_float(nil, { focusable = false })
        print("LSP diagnostics: ON")
    else
        print("LSP diagnostics: OFF")
    end
end, { desc = "Toggle LSP diagnostics" })

