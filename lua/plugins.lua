local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

local packer_bootstrap = ensure_packer()

local packer = require('packer').startup(function(use)
  use({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "rainbowhxch/accelerated-jk.nvim" })
  use({ "jdhao/better-escape.vim" })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config=function()
      require("nvim-treesitter.configs").setup {
        markid = { enable = true },
        matchup = {
          enable = true,
        },
        ensure_installed = { "typescript", "lua", "tsx" },
      }
    end
  })
  use({ "David-Kunz/markid" })
  use({ "andymass/vim-matchup" })

  -- Telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = 'make' })
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } }
  })

  use({ "farmergreg/vim-lastplace" })
  use({ "tpope/vim-unimpaired" })
  use({
    "kylechui/nvim-surround",
    config=function()
      require("nvim-surround").setup()
    end
  })
  use ({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {
        enable_check_bracket_line = false,
      }
    end
  })
  use({ "tpope/vim-repeat" })
  use({ "psliwka/vim-smoothie" })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config=function()
      require('lualine').setup {
        options = {
          theme = 'auto'
        }
      }
    end
  })

  use({ "kyazdani42/nvim-web-devicons" })
  use({ "marko-cerovac/material.nvim" }) 
  use({
    "norcalli/nvim-colorizer.lua", 
    config=function()
      require("colorizer").setup()
    end
  })
  use({ 
    "b0o/incline.nvim",
    config=function()
      require("incline").setup()
    end
  })
  use({
    "lukas-reineke/indent-blankline.nvim",
    config=function()
      require("indent_blankline").setup {
      show_current_context = true,
      show_current_context_start = true,
    }
    end
  })
  use ({
    "m-demare/hlargs.nvim",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config=function()
      require('hlargs').setup()
    end
  })
  
  if packer_bootstrap then
    require('packer').sync()
  end
end)

require("plugin-config/material")
require("plugin-config/telescope")
require("plugin-config/accelerated-jk")

return packer
