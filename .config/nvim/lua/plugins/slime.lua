return {
  {
    'jpalardy/vim-slime',

    lazy = true,

    init = function()
      vim.g.slime_target = 'neovim'
      vim.g.slime_no_mappings = true
    end,

    config = function()
      vim.g.slime_bracketed_paste = 1
    end,

    keys = {
        { '<leader>rr', '<Plug>SlimeRegionSend', mode = 'x', desc = 'Slime RegionSend'},
        { '<leader>rr', '<Plug>SlimeParagraphSend', mode = 'n', desc = 'Slime ParagraphSend'},
        { '<leader>rl', '<Plug>SlimeLineSend', mode = 'n', desc = 'Slime LineSend'},
        { '<leader>rc', '<Plug>SlimeConfig', mode = 'n', desc = 'Slime Config'},
    },

  },
}
