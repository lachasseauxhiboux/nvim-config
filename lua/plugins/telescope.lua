-- Configuration for telescope.nvim
local actions = require('telescope.actions')
local sorters = require('telescope.sorters')
local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')
local api = vim.api
local map = api.nvim_set_keymap
local opts = {noremap = true, silent = true}

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = { mirror = false },
      vertical = { mirror = false },
    },
    file_sorter = sorters.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = sorters.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.7,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' },
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    buffer_previewer_maker = previewers.buffer_previewer_maker,
    pickers = {
      buffers = {
        initial_mode = 'normal',
        mappings = {
          i = { ["<c-d>"] = actions.delete_buffer },
          n = { ["<c-d>"] = actions.delete_buffer },
        }
      }
    }
  }
}

-- Custom function for finding files in the current directory
_G.find_files = function()
    local opts = {}
    opts.cwd = vim.fn.expand('%:p:h')
    builtin.find_files(opts)
end

-- Telescope keymappings
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
map('n', '<leader>f', '<cmd>lua find_files()<cr>', opts)

