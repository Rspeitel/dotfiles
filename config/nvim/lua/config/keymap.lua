vim.g.mapleader = " "

-- Move line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Navigate through windows and split
vim.keymap.set({ 'n' }, '<C-J>', '<C-W><C-J>', { silent = true})
vim.keymap.set({ 'n' }, '<C-K>', '<C-W><C-K>', { silent = true})
vim.keymap.set({ 'n' }, '<C-L>', '<C-W><C-L>', { silent = true})
vim.keymap.set({ 'n' }, '<C-H>', '<C-W><C-H>', { silent = true})
vim.keymap.set({ 'n' }, '<C-M>', ':vsp<CR>'  , { silent = true})
vim.keymap.set({ 'n' }, '<C-N>', ':split<CR>', { silent = true})

-- Copy relative path of current file
vim.keymap.set({ 'n' }, '<leader>c', ':let @*=expand("%")<CR>', { silent = true})

-- 
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)

