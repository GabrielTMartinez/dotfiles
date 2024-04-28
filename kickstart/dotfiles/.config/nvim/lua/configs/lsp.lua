local lspconfig = require('lspconfig')
lspconfig.pyright.setup({settings={['pyright']={['typeCheckingMode'] = 'off'}}})
