-- nvim-treesitter configuration
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "lua", "go" },
  highlight = {
    enable = true,
    disable = {},
  },  
  fold = {
    enable = true,
    disable = {},
  },
}

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldenable = false -- turn off the folding

-- Highlight the @foo.bar capture group with the "Identifier" highlight group
vim.cmd("hi @constant.typescript guifg=#F8F8F2")
vim.cmd("hi @string.typescript guifg=#E6DB74")
vim.cmd("hi @boolean.typescript guifg=#AE81FF")
vim.cmd("hi @number.typescript guifg=#AE81FF")
vim.cmd("hi @comment.typescript guifg=#75715E")
vim.cmd("hi @operator.typescript guifg=#F92672")
vim.cmd("hi @keyword.typescript guifg=#66D9EF")



