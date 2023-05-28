vim.g.mapleader = " "

--clear highlight
vim.keymap.set("n", "<leader>ch", vim.cmd.noh)

--run black for current file
vim.keymap.set("n", "<leader>cr", ':!black % <CR>')

