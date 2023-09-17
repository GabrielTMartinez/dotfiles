vim.g.mapleader = " "

--clear highlight
vim.keymap.set("n", "<leader>ch", vim.cmd.noh)

--Explore Tree (file tree)
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

--run black for current file
vim.keymap.set("n", "<leader>cr", ':!black % <CR>')

-- Comment
vim.keymap.set("n", "<C-_>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
vim.keymap.set("x", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
