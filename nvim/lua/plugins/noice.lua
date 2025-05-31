return {
  'folke/noice.nvim',
  config = function()
    require('noice').setup({
      cmdline = {
        enabled = true,
        view = 'cmdline_popup'
      },
      views = {
        cmdline_popup = {
          position = {
            row = '95%',
            col = '50%'
          }
        }
      },
      messages = {
        enabled = true,
      },
    })
  end
}
