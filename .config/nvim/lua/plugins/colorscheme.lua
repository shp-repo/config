return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },

  -- add rose-pine
  { "rose-pine/neovim", name = "rose-pine" },

  -- Configure LazyVim to load a specified colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "rose-pine-moon",
    },
  },
}
