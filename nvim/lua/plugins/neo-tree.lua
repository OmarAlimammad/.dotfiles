return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('neo-tree').setup({
      default_component_configs = {
        git_status = {
          symbols = {
            added     = '',  -- plus (cross shape)
            modified  = '',  -- wrench (edit tool)
            deleted   = '',  -- trash can
            renamed   = '',  -- right arrow
            untracked = '',  -- question mark in circle
            ignored   = '',  -- toggle off
            unstaged  = '',  -- warning sign (triangle)
            staged    = '',  -- checkmark
            conflict  = '',  -- conflict (Git branch symbol)
          }
        },
        modified = {
          symbol = '●',
          highlight = 'NeoTreeModified',
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },

    })
  end
}
