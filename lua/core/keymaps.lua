local cmd = vim.cmd
local keymap = vim.keymap.set
local command = vim.api.nvim_create_user_command
local opts = { noremap = true, silent = true }

-- General keybindings
keymap('n', '<leader>pv', ':Ex<CR>', opts)

-- Indentation
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Disabling arrow keys
keymap('', '<up>', '<nop>', opts)
keymap('', '<down>', '<nop>', opts)
keymap('', '<left>', '<nop>', opts)
keymap('', '<right>', '<nop>', opts)

-- Buffer navigation
keymap('n', '<C-J>', ':bnext<CR>', opts)
keymap('n', '<C-K>', ':bprevious<CR>', opts)
keymap('n', '<C-D>', ':bd<CR>', opts)

-- LSP-specific keybindings
keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)


-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = false, -- add this to prevent updates while in insert mode
})

-- Diagnostic keymap
keymap('n', '<Leader>d', vim.diagnostic.open_float, opts)

-- Nvim Tree
local function toggle_tree()
    local tree = require'nvim-tree.view'
    if tree.win_open() then
        tree.close()
    else
        tree.open()
    end
end

keymap('n', '<leader>n', toggle_tree, opts)

-- Terminal
local function open_terminal_in_file_dir()
  local path = vim.fn.expand('%:p:h')
  vim.fn.system('gnome-terminal --working-directory=' .. path)
end

keymap('n', '<leader>t', open_terminal_in_file_dir, opts)

-- Clipboard
local function copy_with_line_breaks()
    vim.cmd('normal! ggVG"+y')
end

keymap('v', '<leader>y', copy_with_line_breaks, opts)

-- Git
local function gcp()
    local commitMessage = vim.fn.input('Commit message: ')
    cmd 'Git add .'
    cmd('Git commit -m "' .. commitMessage .. '"')
    cmd 'Git push'
end

local function gnb()
    local branchName = vim.fn.input('New branch name: ')
    cmd('Git checkout -b '..branchName)
end

local function gbn()
    local currentBranch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
    local newBranchName = vim.fn.input('New name for branch [' .. currentBranch .. ']: ')
    if newBranchName ~= "" then
        vim.fn.system('git branch -m ' .. newBranchName)
    else
        print("No new branch name provided. No changes made.")
    end
end

local function grf()
    local file = vim.fn.expand('%:p')
    vim.fn.system('git reset ' .. file)
    vim.fn.system('git checkout -- ' .. file)
    cmd('edit!')
end

command('Gpr', 'Git pull --rebase', {})

keymap('n', '<leader>gpr', ':Gpr<CR>', opts)
keymap('n', '<leader>grf', grf, opts)
keymap('n', '<leader>gcp', gcp, opts)
keymap('n', '<leader>gnb', gnb, opts)
keymap('n', '<leader>gbn', gbn, opts)

-- DLV

keymap('n', '<Leader>bp', ':DlvToggleBreakpoint<CR>', opt)
keymap('n', '<Leader>deb', ':DlvDebug<CR>', opt)

