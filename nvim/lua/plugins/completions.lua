return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'windwp/nvim-autopairs',
    },
    config = function()
      require('nvim-autopairs').setup({})

      local luasnip = require('luasnip')
      local snippet = luasnip.snippet
      local text = luasnip.text_node

      luasnip.add_snippets('cpp', {
        snippet('cd', {
          text({
            '#include <bits/stdc++.h>',
            'using namespace std;',
            '',
            'signed main() {',
            '\tios::sync_with_stdio(0);',
            '\tcin.tie(nullptr);',
            '\t',
            '}'
          }),
        }),
      })

      local cmp = require('cmp')
      cmp.setup({
        window = {
          completion = cmp.config.window.bordered({
            border = 'rounded',
            scrollbar = false,
          }),
          documentation = cmp.config.window.bordered({
            border = 'rounded',
            scrollbar = false,
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ['<Down>'] = cmp.mapping.select_next_item(),
          ['<Up>'] = cmp.mapping.select_prev_item(),
          ['<Tab>'] = cmp.mapping.confirm({ select = true }),
          ['<CR>'] = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }),
      })
    end
  }
}

