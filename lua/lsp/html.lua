require'lspconfig'.html.setup {
  cmd = { "html-languageserver", "--stdio" },
  filetypes = { "html", "htmldjango", "handlebars", "hbs" },
}

