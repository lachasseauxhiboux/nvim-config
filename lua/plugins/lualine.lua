require('lualine').setup {
  options = {
    -- Set the theme for lualine
    theme = 'nordfox',
    -- Display current line number in the status line
    section_separators = {'', ''},
    component_separators = {'', ''},
    -- Set status line to lower case
    lower = true,
  },
  sections = {
    -- Status line sections to be shown before the central section
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    -- Central section of the status line
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    -- Status line sections to be shown after the central section
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  -- Status line sections for inactive buffers
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  -- Status line sections for tabs
  tabline = {},
  -- Set update handlers for the status line
  extensions = {}
}

