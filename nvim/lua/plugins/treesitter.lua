return {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            }
        })
    end
}
