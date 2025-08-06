return {
  'catppuccin/nvim',
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      transparent_background = true,
      integrations = {
        noice = true
      }
    })
    vim.cmd('colorscheme catppuccin')
  end
}

