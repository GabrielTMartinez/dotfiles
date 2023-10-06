-- yank to system clipboard
-- vim.opt.clipboard:append("unnamedplus")

vim.opt.encoding = "utf-8"

-- disable bell sounds
vim.opt.belloff = "all"
--vim.opt.visualbell = true
--vim.opt.t_vb = 

-- turn on line numbers
--vim.opt.number = true
vim.opt.relativenumber = true

-- ruler and cursor positions
--vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- pathogen minimalist recommendations
--vim.cmd("syntax on")
--vim.cmd("filetype plugin indent on")

-- set tab to 4 spaces
-- show existing tab with 4 spaces width
vim.opt.tabstop = 4
-- when indenting with '>', use 4 spaces width
vim.opt.shiftwidth = 4
-- On pressing tab, insert 4 spaces
vim.opt.expandtab = true

-- Enable backspace over auto indent etc
vim.opt.backspace = { "indent", "eol", "start" }

-- Change Explorer / Netrw style to tree
vim.g.netrw_liststyle = 3

-- Having longer updatetime (default is 4000 ms  =  4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
--vim.opt.signcolumn = "yes"

-- Disable omnifunc (params autocomplete) scratchpad open
-- vim.opt.completeopt = { "menu" }
vim.opt.completeopt = { "menuone,noselect" }

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

