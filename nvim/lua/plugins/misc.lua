return {
  {
    "christoomey/vim-tmux-navigator",
    name = "tmux-navigator",
    config = function()
      vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
      vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
      vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
      vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })
    end
  },
  {
    "karb94/neoscroll.nvim",
    name = "neoscroll",
    config = function()
      require("neoscroll").setup({
        mappings = {
          "<C-u>", "<C-d>",
          "<C-b>", "<C-f>",
          "zt", "zz", "zb",
        },
      })
    end
  },
  {
    "kylechui/nvim-surround",
    name = "surround",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          normal = "<leader>s",
          normal_cur = "<leader>ss",
          visual = "<leader>s",
          delete = "<leader>sd",
          change = "<leader>sc",
        },
      })
    end
  },
  {
    "numToStr/Comment.nvim",
    name = "comment",
    config = function()
      require("Comment").setup({
        toggler = {
          line = "<leader>/",
          block = "<leader>\\",
        },
        opleader = {
          line = "<leader>/",
          block = "<leader>\\",
        },
      })
    end
  }
}
