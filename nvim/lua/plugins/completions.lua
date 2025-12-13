return {
  "hrsh7th/nvim-cmp",
  name = "cmp",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp",         name = "cmp-lsp" },
    { "L3MON4D3/LuaSnip",             name = "luasnip" },
    { "rafamadriz/friendly-snippets", name = "cmp-path" },
    { "hrsh7th/cmp-path",             name = "cmp-path" },
    { "windwp/nvim-autopairs",        name = "autopairs" },
    { "saadparwaiz1/cmp_luasnip",     name = "cmp-luasnip" },
    { "rafamadriz/friendly-snippets", name = "friendly-snippets" },
  },
  config = function()
    require("nvim-autopairs").setup({})

    local luasnip = require("luasnip")
    local snippet = luasnip.snippet
    local text = luasnip.text_node

    luasnip.add_snippets("cpp", {
      snippet("cd", {
        text({
          "#pragma GCC optimize(\"Ofast\")",
          "#include \"bits/stdc++.h\"",
          "#define int long long",
          "using namespace std;",
          "",
          "signed main() {",
          "\tios::sync_with_stdio(0);",
          "\tcin.tie(nullptr);",
          "\t",
          "}"
        }),
      }),
      snippet("db", {
        text({
          "// #undef DEBUG",
          "",
          "#ifdef DEBUG",
          "#include \"algo/debug\"",
          "#else",
          "#define dbg(...)",
          "#endif",
        }),
      }),
    })

    require("luasnip.loaders.from_vscode").lazy_load()

    local cmp = require("cmp")
    cmp.setup({
      window = {
        completion = cmp.config.window.bordered({
          border = "rounded",
          scrollbar = false,
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
