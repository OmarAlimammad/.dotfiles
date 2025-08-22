return {
  "folke/noice.nvim",
  name = "noice",
  config = function()
    require("noice").setup({
      lsp = {
        signature = {
          enabled = false
        }
      },
      cmdline = {
        enabled = true,
        view = "cmdline_popup"
      },
      views = {
        cmdline_popup = {
          position = {
            row = "95%",
            col = "50%"
          }
        }
      },
      messages = {
        enabled = true
      }
    })
  end
}
