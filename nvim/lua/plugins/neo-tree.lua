return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('neo-tree').setup({
      default_component_configs = {
        modified = {
          symbol = '●',
          highlight = 'NeoTreeModified',
        },
      },
    })
  end
}
