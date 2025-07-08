return {
  'neovim/nvim-lspconfig',
  dependencies = { 'williamboman/mason.nvim' },
  config = function()
    require('mason').setup({
      ui = {
        border = 'rounded',
      },
    })

    local lspconfig = require('lspconfig')

    lspconfig.lua_ls.setup({})
    lspconfig.pyright.setup({})
    lspconfig.clangd.setup({
      cmd = { 'clangd', '--header-insertion=never', '--function-arg-placeholders=false' }
    })

    vim.diagnostic.config({
      virtual_text = {
        prefix = '',
        format = function(diagnostic)
          local icons = {
            [vim.diagnostic.severity.ERROR] = '  ',
            [vim.diagnostic.severity.WARN]  = '  ',
            [vim.diagnostic.severity.INFO]  = '  ',
            [vim.diagnostic.severity.HINT]  = '  ',
          }
          return icons[diagnostic.severity] .. diagnostic.message
        end,
      },
      float = {
        header = '',
        prefix = '',
        border = 'rounded',
        style = 'minimal',
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN]  = ' ',
          [vim.diagnostic.severity.INFO]  = ' ',
          [vim.diagnostic.severity.HINT]  = ' ',
        },
      },
      severity_sort = true,
      underline = true,
      update_in_insert = false,
    })

    local orig_util = vim.lsp.util.open_floating_preview
    vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or 'rounded'
      return orig_util(contents, syntax, opts, ...)
    end
  end
}
