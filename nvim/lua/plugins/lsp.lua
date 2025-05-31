return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        ui = {
          border = 'rounded'
        }
      })

    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.handlers['textDocument/signatureHelp'] =
      vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'rounded',
      })

      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.clangd.setup({
        handlers = {

        },
        cmd = { 'clangd', '--header-insertion=never', '--function-arg-placeholders=false' }
      })

      vim.diagnostic.config({
        virtual_text = {
          prefix = '',
          format = function(diagnostic)
            local icons = {
              [vim.diagnostic.severity.ERROR] = ' ',
              [vim.diagnostic.severity.WARN]  = ' ',
              [vim.diagnostic.severity.INFO]  = ' ',
              [vim.diagnostic.severity.HINT]  = ' ',
            }
            local msg = diagnostic.message:gsub('\n', ' '):gsub('\r', '')
            return icons[diagnostic.severity] .. msg
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
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN]  = '',
            [vim.diagnostic.severity.INFO]  = '',
            [vim.diagnostic.severity.HINT]  = '',
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
  },
}
