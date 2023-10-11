vim.cmd('autocmd BufWritePost * silent! Git add %')
vim.cmd [[
augroup Prettier
    autocmd!
    autocmd BufWritePre *.js,*.ts,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
augroup END
]]

vim.cmd [[
  autocmd Filetype * setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
]]

