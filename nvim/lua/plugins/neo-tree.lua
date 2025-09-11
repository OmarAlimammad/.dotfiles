return {
  "nvim-neo-tree/neo-tree.nvim",
  name = "neo-tree",
  dependencies = {
    { "MunifTanjim/nui.nvim",        name = "nui" },
    { "nvim-tree/nvim-web-devicons", name = "icons" }
  },
  config = function()
    require("neo-tree").setup({
      default_component_configs = {
        git_status = {
          symbols = {
            added     = "",
            modified  = "",
            deleted   = "",
            renamed   = "",
            untracked = "",
            ignored   = "",
            unstaged  = "",
            staged    = "",
            conflict  = ""
          }
        },
        modified = {
          symbol = "●",
          highlight = "NeoTreeModified"
        }
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false
        }
      }
    })

    vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", { silent = true })
  end
}
