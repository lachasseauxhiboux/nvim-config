local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}


-- переход в Ex мод
map('n', '<leader>pv', ':Ex<CR>', opts)
map('n', 'Q', '<nop>', opts) -- анбинд Q

-- упрощенная индентация
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- отключение стрелочек (только hjkl)
map('', '<up>', '', opts)
map('', '<down>', '', opts)
map('', '<left>', '', opts)
map('', '<right>', '', opts)

-- BufferLine
map('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)

-- Clipboard
vim.g.clipboard = 'unnamedplus'
map('n', 'C-y','"*y', opts)
-- map('n', 'C-y', '!wl-copy', opt)
