local opt = vim.opt  -- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                       -- Enable mouse support
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
opt.spelllang = { 'en_us', 'ru' }     -- English and Russian dictionaries
opt.undofile = true                   -- Enable undo file
opt.splitright = true                 -- Vertical splits to the right
opt.splitbelow = true                 -- Horizontal splits below

-----------------------------------------------------------
-- UI
-----------------------------------------------------------
opt.colorcolumn = '80'              -- Highlight column at 80 characters
opt.cursorline = true               -- Highlight the cursor line
opt.number = true                   -- Enable line numbers
opt.relativenumber = true           -- Enable relative line numbers

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 2          -- Shift 2 spaces when tab
opt.tabstop = 2             -- 1 tab == 2 spaces
opt.smartindent = true      -- Autoindent new lines

-- Set <leader> to space
-----------------------------------------------------------
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Clipboard
-----------------------------------------------------------
opt.clipboard = 'unnamed,unnamedplus'


