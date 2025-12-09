return {
  {
    'https://github.com/neovim/nvim-lspconfig',
    config = function()
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('clangd')
      vim.lsp.enable('marksman')
      vim.lsp.enable('julials')
    end,
  },

  {
     'nvim-treesitter/nvim-treesitter',
     lazy = false,
     branch = 'main',
     build = ':TSUpdate',
     opts = {
         ensure_installed = { 'c', 'lua', 'markdown', 'julia'},
         highlight = { enable = true },
         indent = { enable = true },
       },
  },
}
