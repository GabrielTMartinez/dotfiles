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
			--'morhetz/gruvbox',
			'rebelot/kanagawa.nvim',
			priority = 1000,
			init = function()
				--vim.cmd.colorscheme 'gruvbox'
				vim.cmd.colorscheme 'kanagawa-dragon'
				--vim.cmd.colorscheme 'kanagawa-wave'

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
					ensure_installed = { "lua", "vim", "vimdoc", "query", "javascript", "typescript", "html", "go", "python"},
					sync_install = false,
					highlight = { enable = true },
					indent = { enable = true },
				})
			end
		},
		{
			'nvim-telescope/telescope.nvim',
			tag = '0.1.8',
			dependencies = { 'nvim-lua/plenary.nvim' },
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
			dependencies = {
				'hrsh7th/nvim-cmp',
				'hrsh7th/cmp-nvim-lsp',
			},
			config = function()

				--[[ 
				vim.api.nvim_create_autocmd('LspAttach', {
					group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
					callback = function(event)

					end,
				}) 
				--]]

				local lspconfig_defaults = require('lspconfig').util.default_config
				lspconfig_defaults.capabilities = vim.tbl_deep_extend(
					'force',
					lspconfig_defaults.capabilities,
					require('cmp_nvim_lsp').default_capabilities()
				)

				-- https://github.com/LuaLS/lua-language-server
				require('lspconfig').lua_ls.setup{
					settings = {
						Lua = {
							diagnostics = {
								globals = {'vim'},
							},
						},
					},
				}

				-- https://github.com/golang/tools/tree/master/gopls
				require('lspconfig').gopls.setup{}

				-- https://github.com/typescript-language-server/typescript-language-server
				require('lspconfig').ts_ls.setup{}

				local cmp = require('cmp')
				cmp.setup({
					sources = {
						{name = 'nvim_lsp'},
					},
					snippet = {
						expand = function(args)
							vim.snippet.expand(args.body)
						end,
					},
					mapping = cmp.mapping.preset.insert({
						['<C-Space>'] = cmp.mapping.complete {},
						['<CR>'] = cmp.mapping.confirm { select = true },
					}),
				})

			end
		},
		--[[{
			'hrsh7th/nvim-cmp',
			event = 'InsertEnter',
			dependencies.
		},--]]
	},
	install = { missing = false },
	checker = { enabled = false },
	rocks = { enabled = false },
})
