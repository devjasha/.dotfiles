-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use "rebelot/kanagawa.nvim"
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'nvim-lua/plenary.nvim'
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'nvimdev/lspsaga.nvim' -- LSP UIs
  use 'kyazdani42/nvim-web-devicons'
  use 'akinsho/nvim-bufferline.lua'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use "almo7aya/openingh.nvim"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
end)
