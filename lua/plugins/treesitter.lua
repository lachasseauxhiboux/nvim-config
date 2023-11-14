-- nvim-treesitter configuration
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "lua", "go", "html" },
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

-- JetBrains-like color scheme for Go
vim.cmd("hi @constant.go guifg=#6A8759") -- Green
vim.cmd("hi @string.go guifg=#A5C261") -- Light green
vim.cmd("hi @boolean.go guifg=#CC7832") -- Orange
vim.cmd("hi @number.go guifg=#6897BB") -- Blue
vim.cmd("hi @comment.go guifg=#808080") -- Grey
vim.cmd("hi @operator.go guifg=#A9B7C6") -- Light grey
vim.cmd("hi @keyword.go guifg=#CC7832") -- Orange

-- Additional highlight groups for Go
vim.cmd("hi @function.go guifg=#FFC66D") -- Function names (Yellow)
vim.cmd("hi @type.go guifg=#A9B7C6") -- Type annotations (Light grey)
vim.cmd("hi @field.go guifg=#9876AA") -- Struct fields (Purple)

-- TS
vim.cmd("hi @constant.typescript guifg=#6A8759") -- Green
vim.cmd("hi @string.typescript guifg=#A5C261") -- Light green
vim.cmd("hi @boolean.typescript guifg=#CC7832") -- Orange
vim.cmd("hi @number.typescript guifg=#6897BB") -- Blue
vim.cmd("hi @comment.typescript guifg=#808080") -- Grey
vim.cmd("hi @operator.typescript guifg=#A9B7C6") -- Light grey
vim.cmd("hi @keyword.typescript guifg=#CC7832") -- Orange

-- Additional highlight groups for TypeScript
vim.cmd("hi @function.typescript guifg=#FFC66D") -- Function names (Yellow)
vim.cmd("hi @type.typescript guifg=#A9B7C6") -- Type annotations (Light grey)
vim.cmd("hi @property.typescript guifg=#9876AA") -- Object properties (Purple)


-- JetBrains-like color scheme for HTML
vim.cmd("hi @tag.html guifg=#E8BF6A") -- Tags (Gold)
vim.cmd("hi @attribute.html guifg=#A9B7C6") -- Attributes (Light grey)
vim.cmd("hi @text.html guifg=#FFFFFF") -- Text (White)
vim.cmd("hi @comment.html guifg=#808080") -- Comments (Grey)
vim.cmd("hi @constant.html guifg=#6897BB") -- Constants (Blue)


-- JetBrains-like color scheme for SCSS
vim.cmd("hi @constant.scss guifg=#6A8759") -- Green
vim.cmd("hi @string.scss guifg=#A5C261") -- Light green
vim.cmd("hi @boolean.scss guifg=#CC7832") -- Orange
vim.cmd("hi @number.scss guifg=#6897BB") -- Blue
vim.cmd("hi @comment.scss guifg=#808080") -- Grey
vim.cmd("hi @operator.scss guifg=#A9B7C6") -- Light grey
vim.cmd("hi @keyword.scss guifg=#CC7832") -- Orange

-- Additional highlight groups for SCSS
vim.cmd("hi @function.scss guifg=#FFC66D") -- Function names (Yellow)
vim.cmd("hi @type.scss guifg=#A9B7C6") -- Type annotations (Light grey)
vim.cmd("hi @property.scss guifg=#9876AA") -- Properties (Purple)
vim.cmd("hi @variable.scss guifg=#F8F8F2") -- Variables (White)


-- JetBrains-like color scheme for Lua
vim.cmd("hi @constant.lua guifg=#6A8759") -- Green
vim.cmd("hi @string.lua guifg=#A5C261") -- Light green
vim.cmd("hi @boolean.lua guifg=#CC7832") -- Orange
vim.cmd("hi @number.lua guifg=#6897BB") -- Blue
vim.cmd("hi @comment.lua guifg=#808080") -- Grey
vim.cmd("hi @operator.lua guifg=#A9B7C6") -- Light grey
vim.cmd("hi @keyword.lua guifg=#CC7832") -- Orange

-- Additional highlight groups for Lua
vim.cmd("hi @function.lua guifg=#FFC66D") -- Function names (Yellow)
vim.cmd("hi @type.lua guifg=#A9B7C6") -- Type annotations (Light grey)
vim.cmd("hi @variable.lua guifg=#9876AA") -- Variables (Purple)

