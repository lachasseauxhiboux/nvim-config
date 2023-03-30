local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Color Schema
  -- use 'folke/tokyonight.nvim'
  use 'Mofiqul/dracula.nvim'
  -----------------------------------------------------------
  -- HTML и CSS
  -----------------------------------------------------------
  -- Open/close tag
  use 'idanarye/breeze.vim'
  -- Autoclose tag
  use 'alvan/vim-closetag'
  -- HEX Light
  use 'ap/vim-css-color'
 

  -----------------------------------------------------------
  -- NAVIGATION
  -----------------------------------------------------------
  
  -- Nvim Tree
  use {
    'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly',
      config = function()
        require('plugins.nvim-tree')    
      end
    }

    -- Plenary
    use 'nvim-lua/plenary.nvim'

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim', 
      tag = '0.1.1',
      requires = { 
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-live-grep-args.nvim'},

      },
      config = function()
        require('plugins.telescope')
        require("telescope").load_extension("live_grep_args")
      end
    }
    
    -- Information Line
    use 'kyazdani42/nvim-web-devicons'
    use { 
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = function()
        require('plugins.lualine')
      end
    }

    -- Auto brackets 
    use {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end
    }

    -- Comments for nvim
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

    -- Tabs
    use {
     'akinsho/bufferline.nvim',
      tag = 'v3.*', 
      requires = 'nvim-tree/nvim-web-devicons',
      config = function()
        require('plugins.bufferline')
      end
    }

    use {
      'akinsho/toggleterm.nvim',
      tag = '*', 
      config = function()
        require('plugins.toggleterm')
      end
    }
    
    -----------------------------------------------------------
    -- LSP
    -----------------------------------------------------------
    
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter'
    -- Collection of configurations for built-in LSP client
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Prettier
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/prettier.nvim'


    -----------------------------------------------------------
    -- AUTOCOMPLITE
    -----------------------------------------------------------

    use "hrsh7th/nvim-cmp"
    use {
      'tzachar/cmp-tabnine', 
      run='./install.sh', 
      requires = 'hrsh7th/nvim-cmp'
    }  

    use('onsails/lspkind-nvim')

    -----------------------------------------------------------
    -- ChatGPT
    -----------------------------------------------------------

    use({
      "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup(
        {
          welcome_message = WELCOME_MESSAGE, -- set to "" if you don't like the fancy godot robot
          loading_text = "loading",
          question_sign = "", -- you can use emoji if you want e.g. 🙂
          answer_sign = "ﮧ", -- 🤖
          max_line_length = 120,
          yank_register = "+",
          chat_layout = {
            relative = "editor",
            position = "50%",
            size = {
              height = "80%",
              width = "80%",
            },
          },
          settings_window = {
            border = {
              style = "rounded",
              text = {
                top = " Settings ",
              },
            },
          },
          chat_window = {
            filetype = "chatgpt",
            border = {
              highlight = "FloatBorder",
              style = "rounded",
              text = {
                top = " ChatGPT ",
              },
            },
          },
          chat_input = {
            prompt = "  ",
            border = {
              highlight = "FloatBorder",
              style = "rounded",
              text = {
                top_align = "center",
                top = " Prompt ",
              },
            },
          },
          openai_params = {
            model = "text-davinci-003",
            frequency_penalty = 0,
            presence_penalty = 0,
            max_tokens = 300,
            temperature = 0,
            top_p = 1,
            n = 1,
          },
          openai_edit_params = {
            model = "code-davinci-edit-001",
            temperature = 0,
            top_p = 1,
            n = 1,
          },
          keymaps = {
            close = { "<C-c>", "<Esc>" },
            yank_last = "<C-y>",
            scroll_up = "<C-u>",
            scroll_down = "<C-d>",
            toggle_settings = "<C-o>",
            new_session = "<C-n>",
            cycle_windows = "<Tab>",
          },
        })
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
    })

    -- use {'nvim-lua/plenary.nvim'} -- required for ChatGPT.nvim
    -- use {'kyazdani42/nvim-web-devicons'} -- required for ChatGPT.nvim
    -- use {'jackMort/ChatGPT.nvim'} -- ChatGPT.nvim
    --
    -- require('chat_gpt').setup{
    --   server_url = 'http://localhost:5000',
    --   options = {
    --     max_lines = 20,
    --     message_delay = 1000,
    --     response_delay = 2000,
    --     highlight_bot_messages = true,
    --     highlight_bot_response = true,
    --     send_on_enter = true,
    --     send_on_ctrl_enter = false,
    --     completion = true,
    --     completion_delay = 100,
    --     completion_sources = {'buffer', 'nvim_lua', 'emoji', 'vim_dadbod_completion', 'path'},
    --     completion_filter = nil,
    --     completion_confirm_key = '<Tab>',
    --     completion_auto_change_source = true,
    --     completion_auto_change_source_interval = 5000,
    --     completion_disable_auto_hover = true,
    --     open_auto_insert = true,
    --     open_auto_popup = false,
    --     open_resize_popup = false,
    --     open_height = 15,
    --     open_width = 60,
    --     open_border = true,
    --     open_position = 'bottomright',
    --     open_mapping = '<leader>cc',
    --     close_mapping = '<Esc>',
    --   }
    -- }
    --

    if packer_bootstrap then
      require('packer').sync()
    end

end)



