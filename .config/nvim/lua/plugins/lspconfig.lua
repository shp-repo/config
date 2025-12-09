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
}
