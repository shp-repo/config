--[[
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    -- Temporary setup for lsp & treesitter working together
    -- Hightlighting
    -- vim.treesitter.start()
    -- Folds
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo.foldmethod = 'expr'

    -- https://lsp-zero.netlify.app/blog/lsp-client-features.html
    -- Custom keymaps
    local opts = {buffer = event.buf}

    vim.keymap.set('n', '<C-Space>', '<C-x><C-o>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set({'n', 'x'}, 'gq', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

    vim.keymap.set('n', 'grt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'grd', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)

    -- Autotrigger: show the completion menu
    --              when type a "trigger char" set by the language server
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
    end

    -- Format on save
    -- Inlay hints
    -- Highlight the references of the symbol under the cursor
    -- Simple tab completion

  end,
})
--]]


-- require'nvim-treesitter'.install { 'bash', 'lua', 'markdown', 'c', 'julia' }


-- nvim-cmp plugin
require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }   -- nvim_lsp denotes cmp-nvim-lsp plugin
  }
}


-- cmp-nvim-lsp plugin
local capabilities = require('cmp_nvim_lsp').default_capabilities()


-- lsp default config which is merged into individual lsp client configs in lsp folder
vim.lsp.config('*', {
  capabilities = capabilities
})

vim.lsp.enable 'bashls'
vim.lsp.enable 'luals'
vim.lsp.enable 'julials'
vim.lsp.enable 'clangd'
vim.lsp.enable 'marksman'

