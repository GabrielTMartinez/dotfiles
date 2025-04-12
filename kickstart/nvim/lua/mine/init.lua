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
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

--for deleting whole words in insert mode
vim.keymap.set("i", "<C-BS>", "<C-o>diw<BS>", { noremap = true })


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
--vim.opt.list = true
--vim.opt.listchars = "space:·,tab:->,trail:-,nbsp:+"
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

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    --local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    --for cid, res in pairs(result or {}) do
    --  for _, r in pairs(res.result or {}) do
    --    if r.edit then
    --      local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
    --      vim.lsp.util.apply_workspace_edit(r.edit, enc)
    --    end
    --  end
    --end
    vim.lsp.buf.format({async = false})
  end
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

