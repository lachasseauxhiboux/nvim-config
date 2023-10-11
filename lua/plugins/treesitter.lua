-- nvim-treesitter configuration
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "lua" },
  highlight = {
    enable = true,
    disable = {},
  },  
  fold = {
    enable = true,
    disable = {},
  },
}

-- Set colors for standard highlight groups
vim.cmd[[highlight TSConstant guifg=#F8F8F2 gui=none]]  -- Light gray for constants
vim.cmd[[highlight TSString guifg=#E6DB74 gui=none]]  -- Yellow for strings
vim.cmd[[highlight TSBoolean guifg=#AE81FF gui=none]]  -- Purple for booleans
vim.cmd[[highlight TSNumber guifg=#AE81FF gui=none]]  -- Purple for numbers
vim.cmd[[highlight TSComment guifg=#75715E gui=none]]  -- Dark gray for comments
vim.cmd[[highlight TSOperator guifg=#F92672 gui=none]]  -- Pink for operators
vim.cmd[[highlight TSKeyword guifg=#66D9EF gui=none]]  -- Light blue for keywords

