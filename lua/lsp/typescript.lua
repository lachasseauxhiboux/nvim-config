local lspconfig = require('lspconfig')

lspconfig.tsserver.setup{
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
    end,
    flags = {
        debounce_text_changes = 150,
    }
}

