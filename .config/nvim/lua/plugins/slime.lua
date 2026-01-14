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
      vim.g.slime_cell_delimiter = '# %%.*$'
    end,

    keys = {
        { '<leader>rr', '<Plug>SlimeRegionSend', mode = 'x', desc = 'Slime RegionSend'},
        { '<leader>rr', '<Plug>SlimeParagraphSend', mode = 'n', desc = 'Slime ParagraphSend'},
        { '<leader>rl', '<Plug>SlimeLineSend', mode = 'n', desc = 'Slime LineSend'},
        { '<leader>rf', ':%SlimeSend<CR>', mode = 'n', desc = 'Slime FileSend'},
        { '<leader>rc', '<Plug>SlimeSendCell<CR>', mode = 'n', desc = 'Slime SendCell'},
        { '<leader>rt', '<Plug>SlimeConfig', mode = 'n', desc = 'Slime Config'},
    },

  },
}
