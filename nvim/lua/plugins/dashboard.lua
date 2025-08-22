return {
  "nvimdev/dashboard-nvim",
  name = "dashboard",
  config = function()
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          "",
          "",
          "",
          "",
          "",
          "                                                                   ",
          "      ████ ██████           █████      ██                    ",
          "     ███████████             █████                            ",
          "     █████████ ███████████████████ ███   ███████████  ",
          "    █████████  ███    █████████████ █████ ██████████████  ",
          "   █████████ ██████████ █████████ █████ █████ ████ █████  ",
          " ███████████ ███    ███ █████████ █████ █████ ████ █████ ",
          "██████  █████████████████████ ████ █████ █████ ████ ██████",
          "",
          "",
          "",
          "",
          "",
        },
        center = {
          {
            icon = "  ",
            desc = "Open File          ",
            key = "a",
            action = function()
              vim.ui.input({ prompt = "File name: " }, function(input)
                if input and input ~= "" then
                  vim.cmd("e " .. input)
                end
              end)
            end,
          },
          {
            icon = "  ",
            desc = "File Explorer      ",
            key = "e",
            action = "Neotree toggle"
          },
          {
            icon = "  ",
            desc = "Find Files         ",
            key = "f",
            action = "Telescope find_files"
          },
          {
            icon = "  ",
            desc = "Recent Files       ",
            key = "r",
            action = "Telescope oldfiles"
          },
          {
            icon = "  ",
            desc = "Config             ",
            key = "c",
            action = "e ~/.dotfiles/nvim"
          },
          {
            icon = "  ",
            desc = "Quit               ",
            key = "q",
            action = "qa"
          }
        },
        footer = {}
      },
    })
  end
}
