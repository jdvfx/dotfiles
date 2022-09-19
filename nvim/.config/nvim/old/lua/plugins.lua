-- Intall Packer
local install_path = vim.fn.stdpath 'data'.. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)

  -- Package manager
  use "wbthomason/packer.nvim"

-- Git commands in nvim
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'numToStr/Comment.nvim'
  -- Highlight, edit, and navigate code
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textObjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- configs for built-in LSP client
  use 'neovim/nvim-lspconfig'
  -- install language servers
  use 'williamboman/nvim-lsp-installer'
  -- autocomplete
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }
  use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }

  use 'nvim-lualine/lualine.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'tpope/vim-sleuth'
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }

  use "tiagovla/tokyodark.nvim"

  if is_bootstrap then
    require('packer').sync()
  end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

