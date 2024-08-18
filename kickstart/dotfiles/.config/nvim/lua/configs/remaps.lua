vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

--run black for current file
vim.keymap.set("n", "<leader>cf", ':!black % <CR><CR>')
vim.keymap.set("n", "<leader>cl", ':!ruff --fix % <CR><CR>')
-- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

-- Open explorer (netrw) on the side panel
vim.keymap.set("n", "<leader><leader>", ":Vexplore<CR>")
vim.api.nvim_create_autocmd({"BufAdd"}, {
  pattern = {"*"},
  callback = function()
    if #vim.api.nvim_list_wins() > 1 then
      vim.g.netrw_browse_split = 4 -- open in previous window
    else
      vim.g.netrw_browse_split = 0 -- open in current window
    end
  end,
})

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

-- Ctrl+c
vim.keymap.set({"n","v"}, "<C-c>", "\"+y")
