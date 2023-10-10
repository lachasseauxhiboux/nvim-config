-- nvim-treesitter configuration
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",
  -- This enables the highlight module, which highlights the code using the parser
  highlight = {
    enable = true,
    -- List of language that will be disabled
    disable = {},
  },
  -- Additional modules and their options go here
}

-- Set colors for standard highlight groups
vim.cmd[[highlight TSConstant guifg=#F8F8F2 gui=none]]  -- Light gray for constants
vim.cmd[[highlight TSString guifg=#E6DB74 gui=none]]  -- Yellow for strings
vim.cmd[[highlight TSBoolean guifg=#AE81FF gui=none]]  -- Purple for booleans
vim.cmd[[highlight TSNumber guifg=#AE81FF gui=none]]  -- Purple for numbers
vim.cmd[[highlight TSComment guifg=#75715E gui=none]]  -- Dark gray for comments
vim.cmd[[highlight TSOperator guifg=#F92672 gui=none]]  -- Pink for operators
vim.cmd[[highlight TSKeyword guifg=#66D9EF gui=none]]  -- Light blue for keywords

