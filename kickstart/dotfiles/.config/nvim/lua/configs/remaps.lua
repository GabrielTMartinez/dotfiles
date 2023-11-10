vim.g.mapleader = " "

--Explore Tree (file tree)
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

--run black for current file
-- vim.keymap.set("n", "<leader>cr", ':!black % <CR>')

-- Indent
vim.keymap.set("n", "<leader>if", "gg=G<C-o>")

-- Omnifunc (params autocomplete)
vim.keymap.set("i", "<C-Space><C-Space>", "<C-x><C-o>")

-- Autoclose pairs
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", "[", "[]<Left>")
vim.keymap.set("i", "\"", "\"\"<Left>")
vim.keymap.set("i", "'", "''<Left>")

