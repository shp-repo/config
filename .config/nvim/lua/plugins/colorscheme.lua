return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },

  {
    'catppuccin/nvim',
    -- enabled = false,
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-macchiato]])
    end,
  },

  {
    'rebelot/kanagawa.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme kanagawa-dragon]])
    end,
  },

  {
    'kepano/flexoki-neovim',
    enabled = false,
    name = 'flexoki',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme flexoki-dark]])
    end,
    }
}
