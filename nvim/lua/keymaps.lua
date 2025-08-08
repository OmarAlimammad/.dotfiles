vim.g.mapleader = " "

vim.keymap.set("n", "<leader>q", ":q!<CR>", { silent = true })
vim.keymap.set("n", "<leader>e", ":%y+<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", ":silent w<CR>", { silent = true })
vim.keymap.set("n", "<leader>g", "gg=G", { silent = true })

vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", { silent = true })

vim.keymap.set("n", "<C-h>", ":TmuwNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })

vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { silent = true })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { silent = true })
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { silent = true })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { silent = true })
