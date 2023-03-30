require('telescope').setup{
	pickers = {
		buffers = {
			-- начинать в normal моде при открытии списка буферов
			initial_mode = 'normal'
		}
	}
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

