local lsp_with = vim.lsp.with
local lsp_handlers = vim.lsp.handlers


lsp_handlers["textDocument/hover"] = lsp_with(lsp_handlers.hover, {
  border = "rounded",
  width = 60,
  height = 30,
})

lsp_handlers["textDocument/signatureHelp"] = lsp_with(lsp_handlers.signature_help, {
  border = "rounded",
  width = 60,
  height = 20,
})

