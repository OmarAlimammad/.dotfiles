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
          delete = '<leader>sd',
          change = '<leader>sc',
        },
      })
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        toggler = {
          line = '<leader>/',
          block = '<leader>\\',
        },
        opleader = {
          line = '<leader>/',
          block = '<leader>\\',
        },
      })
    end
  }
}
