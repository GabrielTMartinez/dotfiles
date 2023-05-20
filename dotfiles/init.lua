vim.cmd("set clipboard+=unnamedplus")

vim.cmd("set encoding=utf-8")

-- disable bell sounds
vim.cmd("set visualbell")
vim.cmd("set t_vb=")

-- turn on line numbers
--vim.cmd("set number")
vim.cmd("set relativenumber")

-- ruler and cursor positions
--vim.cmd("set ruler")
--vim.cmd("set cursorline")
vim.cmd("set cursorcolumn")

-- pathogen minimalist recommendations
--vim.cmd("syntax on")
--vim.cmd("filetype plugin indent on")

-- set tab to 4 spaces
-- show existing tab with 4 spaces width
vim.cmd("set tabstop=4")
-- when indenting with '>', use 4 spaces width
vim.cmd("set shiftwidth=4")
-- On pressing tab, insert 4 spaces
vim.cmd("set expandtab")

-- Enable backspace over auto indent etc
vim.cmd("set backspace=indent,eol,start")

-- Change Explorer / Netrw style to tree
vim.cmd("let g:netrw_liststyle=3")

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.cmd("set updatetime=300")

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
--vim.cmd("set signcolumn=yes")

