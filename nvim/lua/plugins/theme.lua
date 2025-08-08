return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            integrations = {
                noice = true
            }
        })
        vim.cmd("colorscheme catppuccin")
    end
}
