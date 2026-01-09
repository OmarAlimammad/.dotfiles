return {
  "hrsh7th/nvim-cmp",
  name = "cmp",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp",         name = "cmp-lsp" },
    { "onsails/lspkind.nvim",         name = "lspkind" },
    { "L3MON4D3/LuaSnip",             name = "luasnip" },
    { "windwp/nvim-autopairs",        name = "autopairs" },
    { "saadparwaiz1/cmp_luasnip",     name = "cmp-luasnip" },
    { "rafamadriz/friendly-snippets", name = "friendly-snippets" },

  },
  config = function()
    local luasnip = require("luasnip")
    local snippet = luasnip.snippet
    local text = luasnip.text_node

    luasnip.add_snippets("cpp", {
      snippet("cd", {
        text({
          "#include <bits/stdc++.h>",
          "using namespace std;",
          "",
          "int main() {",
          "\t",
          "}",
        }),
      }),
      snippet("tc", {
        text({
          "int t;",
          "cin >> t;",
          "while (t--) [] {",
          "\t",
          "}();",
        }),
      }),
    })

    require("luasnip.loaders.from_vscode").lazy_load()
    require("nvim-autopairs").setup({})

    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      formatting = {
        fields = { "abbr", "kind" },
        format = lspkind.cmp_format({
          mode = "symbol"
        })
      },
      window = {
        completion = cmp.config.window.bordered({
          border = "rounded",
          scrollbar = false,
          max_height = 20,
        }),
        documentation = cmp.config.window.bordered({
          border = "rounded",
          scrollbar = false,
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.abort(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }),
    })
  end
}
