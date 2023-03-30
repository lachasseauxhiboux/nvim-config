require('nvim-treesitter.configs').setup{
ensure_installed = 'all',
-- установка phpdoc падает на m1
ignore_install = { 'phpdoc' },
-- включить подсветку
highlight = { enable = true }
}
