return {
  'catppuccin/nvim',
  config = function()
    require('catppuccin').setup({
      transparent_background = true,
    })
    vim.cmd.colorscheme('catppuccin')
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
  end,
}
