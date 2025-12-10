return {
  {
    'jpalardy/vim-slime',
    lazy = true,
    dev = false,
    init = function()
      vim.g.slime_target = 'neovim'
      vim.g.slime_no_mappings = true
    end,
  },
}
