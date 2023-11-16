vim.g.mapleader = " "

--Explore Tree (file tree)
vim.keymap.set("n", "<leader>ex", ':NvimTreeToggle<CR>')

--run black for current file
vim.keymap.set("n", "<leader>cf", ':!black % <CR><CR>')
vim.keymap.set("n", "<leader>cl", ':!ruff --fix % <CR><CR>')
-- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

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

