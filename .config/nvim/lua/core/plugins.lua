local ensure_packer= function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { "ellisonleao/gruvbox.nvim" }
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    requires = { {'nvim-lua/plenary.nvim'},
                  {'BurntSushi/ripgrep'}
    }
  }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use "rebelot/kanagawa.nvim"
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
  }
  use {
    'alvan/vim-closetag',
    config = function()
      vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'
      vim.g.closetag_filetypes = 'html,xhtml,phtml,javascriptreact,typescriptreact'
      vim.g.closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
      vim.g.closetag_emptyTags_caseSensitive = 1
      vim.g.closetag_shortcut = '>'
      vim.g.closetag_close_shortcut = '<Leader>>'
      vim.g.closetag_regions = {
        ['typescript.tsx'] = 'jsxRegion,tsxRegion',
        ['javascript.jsx'] = 'jsxRegion',
      }
    end
  }
  use {
    'windwp/nvim-ts-autotag',
    config = function ()
      require('nvim-ts-autotag').setup()
    end
  }
  use 'bluz71/vim-moonfly-colors'
  use 'metalelf0/base16-black-metal-scheme'
  use 'RRethy/base16-nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)


