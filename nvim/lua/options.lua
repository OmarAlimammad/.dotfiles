vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.termguicolors = true

vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.scrolloff = 10

vim.opt.signcolumn = "no"

vim.opt.laststatus = 0
vim.opt.statusline = ""

vim.opt.foldmethod = "manual"
vim.opt.foldtext = [[v:lua.FoldText()]]

function _G.FoldText()
    return vim.fn.getline(vim.v.foldstart) .. " ..."
end

vim.opt.fillchars:append({ eob = " ", fold = " " })
