local packer = require('packer')

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
    vim.cmd [[packadd packer.nvim]]

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- EditorConfig
  use 'gpanders/editorconfig.nvim'

  -- Indent guide
  use "lukas-reineke/indent-blankline.nvim"

  -- Icon
  use 'kyazdani42/nvim-web-devicons'

  -- File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Bufferline
  use {'akinsho/bufferline.nvim', tag = 'v2.*'}

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- Fterm
  use 'numToStr/FTerm.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  }

  -- Theme
  use 'eddyekofo94/bogster.nvim' -- Bogster
  use 'rebelot/kanagawa.nvim' -- Kanagawa

  -- Startscreen
  use 'goolord/alpha-nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind.nvim'
  use 'arkav/lualine-lsp-progress'
  use 'folke/trouble.nvim'
  use 'kosayoda/nvim-lightbulb'

  -- Mason
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  }

  -- Statusline
  use 'nvim-lualine/lualine.nvim'

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'

  -- Snippet
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Autopairs
  use 'windwp/nvim-autopairs'

  -- Which Key
  use 'folke/which-key.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    packer.sync()
  end
end)

