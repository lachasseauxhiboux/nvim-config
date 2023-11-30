local lspconfig = require('lspconfig')

lspconfig.angularls.setup{

    cmd = { "node", "/usr/local/lib/node_modules/@angular/language-server/bin/ngserver", "--stdio" },
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
    end,
    flags = {
        debounce_text_changes = 150,
    }
}

