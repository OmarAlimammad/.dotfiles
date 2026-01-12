vim.g.mapleader = ";"

vim.keymap.set("n", "<leader>q", ":q!<CR>", { silent = true })
vim.keymap.set("n", "<leader>e", ":%y+<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", ":silent w<CR>", { silent = true })

vim.keymap.set("n", "<leader>f", function()
  local filename = vim.fn.expand("%:t")
  local extension = vim.fn.expand("%:e")
  local modified = vim.bo.modified and "●" or ""
  local icon, icon_hl = require("nvim-web-devicons").get_icon(filename, extension, { default = true })
  local fullpath = vim.fn.expand("%:p:h")
  local home = vim.fn.expand("~")
  local path = fullpath:gsub("^" .. vim.pesc(home), "~")

  if filename == "" or vim.bo.filetype == "neo-tree" then
    return
  end

  local message = {
    { modified .. " ",              "DiagnosticWarn" },
    { icon and (icon .. " ") or "", icon_hl or "Normal" },
    { path .. "/",                  "Comment" },
    { filename,                     "Title" },
  }

  local tick = vim.b.file_info_tick or 0
  tick = (tick + 1) % 2
  vim.b.file_info_tick = tick

  local dummy_hl = tick == 0 and "Comment" or "Normal"
  table.insert(message, { " ", dummy_hl })

  vim.api.nvim_echo(message, false, {})
end, { desc = "Show full file info" })
