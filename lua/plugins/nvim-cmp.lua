local cmp = require'cmp'
local lspconfig = require('lspconfig')
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
              fallback()
          end
      end, { "i", "s", "c" }),
      
      ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
              fallback()
          end
      end, { "i", "s", "c" }),

      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
 
    sources = {
        { name = 'luasnip' },  -- For luasnip users. Uncomment if you are using luasnip.
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' },  -- You can specify the `git` source if you have installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?`.
cmp.setup.cmdline({ '/', '?' }, {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
  })

lspconfig.angularls.setup{
    cmd = { "node", vim.fn.stdpath('data') .. "/lspinstall/angular/node_modules/@angular/language-server/bin/ngserver", "--stdio" },
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false

        require('cmp_nvim_lsp').setup({
        }, bufnr)
    end,
    flags = {
        debounce_text_changes = 150,
    }
}

lspconfig.gopls.setup{
    on_attach = function(client, bufnr)
        require('cmp_nvim_lsp').setup({
        }, bufnr)
    end,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}
