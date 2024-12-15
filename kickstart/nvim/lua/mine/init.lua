vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

--when using nvim-tree plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set({"n","v"}, "<C-c>", "\"+y")
vim.keymap.set("n", "<leader>if", "gg0vG$=<Esc>")
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)

-- Omnifunc (params autocomplete)
vim.keymap.set("i", "<C-Space><C-Space>", "<C-x><C-o>")

vim.opt.clipboard:append("unnamedplus")
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.belloff = "all"
vim.opt.visualbell = true
--vim.opt.t_vb = ''
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.list = true
vim.opt.listchars = "space:·,tab:->,trail:-,nbsp:+"
-- indentation configs
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 0
--vim.opt.expandtab = true -- if you want to change tabs to white spaces
vim.opt.shiftround = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Enable backspace over auto indent etc
--vim.opt.backspace = { "indent", "eol", "start" }

vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.completeopt = { "menu,noselect,preview" }

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

vim.api.nvim_create_user_command('BufferDiff', function()
	pcall(function ()
		vim.cmd(":w !diff % -")
	end)
end, { desc = 'Show buffer changes since last save' })

vim.api.nvim_create_user_command('GitChanged', function()
	pcall(function ()
		vim.cmd(":enew | read !git diff --name-only")
	end)
end, { desc = 'Open a new buffer with the paths of changed git files' })

