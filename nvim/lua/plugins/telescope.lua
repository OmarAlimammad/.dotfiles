return {
  "nvim-telescope/telescope.nvim",
  name = "telescope",
  dependencies = {
    { "nvim-telescope/telescope-ui-select.nvim", name = "telescope-ui-select" }
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({})
        }
      }
    })
    require("telescope").load_extension("ui-select")
  end
}
