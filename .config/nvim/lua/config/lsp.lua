require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', {
  capabilities = capabilities
})

vim.lsp.enable 'bashls'
vim.lsp.enable 'luals'
vim.lsp.enable 'julials'
vim.lsp.enable 'clangd'
vim.lsp.enable 'marksman'

