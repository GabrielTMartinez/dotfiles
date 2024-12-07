require('mine')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{
			'morhetz/gruvbox',
			priority = 1000,
			init = function()
				vim.cmd.colorscheme 'gruvbox'

				-- You can configure highlights by doing something like:
				vim.cmd.hi 'Comment gui=none'
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function () 
				local configs = require("nvim-treesitter.configs")

				configs.setup({
					ensure_installed = { "lua", "vim", "vimdoc", "query", "javascript", "html", "go", "python"},
					sync_install = false,
					highlight = { enable = true },
					indent = { enable = true },  
				})
			end
		},
		{
			'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' },
			config = function()
				local builtin = require('telescope.builtin')
				vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
				vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
				vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
				vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
			end
		},
		{
			"nvim-tree/nvim-tree.lua",
			version = "1.8.0",
			lazy = false,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				local builtin = require("nvim-tree")
				builtin.setup {}
				vim.keymap.set('n', '\\', ':NvimTreeToggle<CR>', {
					noremap = true
				})
			end,
		},
		{
			'neovim/nvim-lspconfig',
			config = function()

				vim.api.nvim_create_autocmd('LspAttach', {
					group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
					callback = function(event)

						-- The following two autocommands are used to highlight references of the
						-- word under your cursor when your cursor rests there for a little while.
						--    See `:help CursorHold` for information about when this is executed
						--
						-- When you move your cursor, the highlights will be cleared (the second autocommand).
						local client = vim.lsp.get_client_by_id(event.data.client_id)
						if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
							local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
							vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
								buffer = event.buf,
								group = highlight_augroup,
								callback = vim.lsp.buf.document_highlight,
							})

							vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
								buffer = event.buf,
								group = highlight_augroup,
								callback = vim.lsp.buf.clear_references,
							})

							vim.api.nvim_create_autocmd('LspDetach', {
								group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
								callback = function(event2)
									vim.lsp.buf.clear_references()
									vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
								end,
							})
						end
					end,
				})

				-- https://github.com/LuaLS/lua-language-server
				require'lspconfig'.lua_ls.setup{}

			end
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { missing = false },
	-- automatically check for plugin updates
	checker = { enabled = false },
})
