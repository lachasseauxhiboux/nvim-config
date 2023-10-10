local cmd = vim.cmd
local api = vim.api
local map = api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Custom function for Git commit and push (Gcp)
function Gcp()
    local commitMessage = vim.fn.input('Commit message: ')
    cmd 'Git add .'
    cmd('Git commit -m "' .. commitMessage .. '"')
    cmd 'Git push'
end

-- Custom function for Git new branch (Gnb)
function Gnb()
    local branchName = vim.fn.input('New branch name: ')
    cmd('Git checkout -b '..branchName)
end

-----------------------------------------------------------
-- General keybindings
-----------------------------------------------------------
-- Switch to command-line mode
map('n', '<leader>pv', ':Ex<CR>', opts)

-----------------------------------------------------------
-- Indentation
-----------------------------------------------------------
-- Indent selected text and reselect it
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-----------------------------------------------------------
-- Disabling arrow keys
-----------------------------------------------------------
-- Disable up arrow
map('', '<up>', '<nop>', opts)
-- Disable down arrow
map('', '<down>', '<nop>', opts)
-- Disable left arrow
map('', '<left>', '<nop>', opts)
-- Disable right arrow
map('', '<right>', '<nop>', opts)

-----------------------------------------------------------
-- BUFFER
-----------------------------------------------------------
-- Switch to next buffer with C-J
map('n', '<C-J>', ':bnext<CR>', opts)
-- Switch to previous buffer with C-K
map('n', '<C-K>', ':bprevious<CR>', opts)
-- Delete the current buffer with C-D
map('n', '<C-D>', ':bd<CR>', opts)

-----------------------------------------------------------
-- NVIM TREE
-----------------------------------------------------------

local function toggle_tree()
    local tree = require'nvim-tree.view'
    if tree.win_open() then
        tree.close()
    else
        tree.open()
    end
end

map('n', '<leader>n', ':lua toggle_tree()<CR>', { noremap = true, silent = true })

function OpenTerminalInFileDir()
  local path = vim.fn.expand('%:p:h')  -- Get the current file's directory
  print("Opening terminal in:", path)
  local cmd = string.format('gnome-terminal --working-directory=%s', path)
  vim.fn.system(cmd)
end

map('n', '<leader>t', ':lua OpenTerminalInFileDir()<CR>', { noremap = true, silent = true })

-----------------------------------------------------------
-- Clipboard
-----------------------------------------------------------
function CopyWithLineBreaks()
    vim.cmd('normal! ggVG"+y')
end

map('v', '<leader>y', ':lua CopyWithLineBreaks()<CR>', { noremap = true, silent = true })

-----------------------------------------------------------
-- Git
-----------------------------------------------------------
vim.api.nvim_command('command! Gpr Git pull --rebase')
map('n', '<leader>gpr', ':Gpr<CR>', opts)

function GitRevertFile()
    local file = vim.fn.expand('%:p')
    vim.fn.system(string.format('git reset %s', file))
    vim.cmd('edit!')
end

map('n', '<leader>gr', ':lua GitRevertFile()<CR>', { noremap = true, silent = true})

map('n', '<leader>gcp', ':lua Gcp()<CR>', {noremap = true, silent = true})
map('n', '<leader>gnb', ':lua Gnb()<CR>', {noremap = true, silent = true})

