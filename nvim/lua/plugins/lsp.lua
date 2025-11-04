return {
  "neovim/nvim-lspconfig",
  name = "lspconfig",
  dependencies = {
    { "williamboman/mason.nvim",         name = "mason" },
    { "nvimtools/none-ls.nvim",          name = "null_ls" },
    { "nvim-treesitter/nvim-treesitter", name = "treesitter" },
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    })

    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      }
    })

    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.yapf.with({
          extra_args = { "--style={based_on_style: pep8, indent_width: 2}" }
        })
      }
    })

    vim.lsp.enable("ts_ls")
    vim.lsp.enable("jdtls")
    vim.lsp.enable("bashls")
    vim.lsp.enable("yamlls")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("pyright")
    vim.lsp.enable("clangd")

    vim.lsp.config("clangd", {
      cmd = { "clangd", "--header-insertion=never", "--function-arg-placeholders=false" }
    })

    vim.diagnostic.config({
      virtual_text = {
        prefix = "",
        format = function(diagnostic)
          local icons = {
            [vim.diagnostic.severity.ERROR] = "  ",
            [vim.diagnostic.severity.WARN]  = "  ",
            [vim.diagnostic.severity.INFO]  = "  ",
            [vim.diagnostic.severity.HINT]  = "  ",
          }
          return icons[diagnostic.severity] .. diagnostic.message
        end,
      },
      float = {
        header = "",
        prefix = "",
        border = "rounded",
        style = "minimal",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN]  = " ",
          [vim.diagnostic.severity.INFO]  = " ",
          [vim.diagnostic.severity.HINT]  = " ",
        },
      },
      severity_sort = true,
      underline = true,
      update_in_insert = false,
    })

    local orig_util = vim.lsp.util.open_floating_preview
    vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded"
      return orig_util(contents, syntax, opts, ...)
    end

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true })
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.format, { silent = true })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { silent = true })
    vim.keymap.set("n", "<leader>g", vim.lsp.buf.definition, { silent = true })
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { silent = true })
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { silent = true })
  end
}
