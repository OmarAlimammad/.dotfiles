return {
  {
    'christoomey/vim-tmux-navigator'
  },
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup({
        mappings = {
          '<C-u>', '<C-d>',
          '<C-b>', '<C-f>',
          'zt', 'zz', 'zb',
        },
      })
    end
  },
  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup({
        keymaps = {
          normal = '<leader>s',
          normal_cur = '<leader>ss',
          visual = '<leader>s',
          delete = '<leader>ds',
          change = '<leader>cs',
        },
      })
    end
  },
  {
    'stevearc/dressing.nvim',
  }
}
