local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Auto compile when there are changes in plugins file
vim.cmd 'autocmd BufWritePost plugins/init.lua PackerCompile'

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP and related plugins
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    use {
        -- The plugin repository "nvim-treesitter/nvim-treesitter" is the source of the plugin
        'nvim-treesitter/nvim-treesitter',
        
        -- 'run' specifies a command to be run after the plugin is installed. ':TSUpdate' ensures that
        -- the tree-sitter parsers are always up-to-date.
        run = ':TSUpdate'
    } 

    -- Requires for different plugins
    use 'nvim-lua/plenary.nvim'

    use 'nvim-telescope/telescope.nvim'

    -- File explorer tree for Neovim
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {'nvim-tree/nvim-web-devicons'},
    }

    -- CMP
    use {
    'hrsh7th/nvim-cmp',
    requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        }
    }
    use "rafamadriz/friendly-snippets"

    -- Autopairs
    use {
      "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    
    -- NVIM Comments
    use 'terrortylor/nvim-comment'

    -- Color Schema
    use 'EdenEast/nightfox.nvim'

    -- Git
    use 'sindrets/diffview.nvim'
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'   
    -- use { 'TimUntersberger/neogit' }

    -- LUA line
    use {
     'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Prettier 
    use {
     'prettier/vim-prettier',
      run = 'yarn install',
      ft = {
        'javascript', 'typescript', 'css', 'less', 'scss', 
        'json', 'graphql', 'markdown', 'vue', 'svelte', 
        'yaml', 'html'
      }
    }

end)

-- Require settings
require('plugins.nvim-tree')
require('plugins.telescope') 
require('plugins.treesitter')
require('plugins.nvim-cmp')
require('plugins.lualine')
-- require('plugins.neogit')
require('plugins.prettier')
require('nvim_comment').setup()
