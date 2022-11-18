local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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

local status_ok, _packer = pcall(require, "packer")
if not status_ok then
  return
end

_packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

local packer_bootstrap = ensure_packer()

local packer = require('packer').startup(function(use)
  use({ "wbthomason/packer.nvim" })
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "marko-cerovac/material.nvim" })
  use({ "lewis6991/impatient.nvim" })
  use({ "psliwka/vim-smoothie" })
  use({ "nathom/filetype.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "rainbowhxch/accelerated-jk.nvim" })
  use({ "jdhao/better-escape.vim" })
  use({ "farmergreg/vim-lastplace" })
  use({ "christoomey/vim-system-copy" })
  use({ "tpope/vim-repeat" })
  use({
    "b0o/incline.nvim",
    config = function()
      require("incline").setup()
    end
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        markid = { enable = true },
        matchup = {
          enable = true,
        },
        ensure_installed = { "typescript", "lua", "tsx" }
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

  -- Git
  use({ "almo7aya/openingh.nvim" })
  use({ "lewis6991/gitsigns.nvim" })

  -- LSP
  use({ "neovim/nvim-lspconfig" })
  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "RRethy/vim-illuminate" })
  use({ "j-hui/fidget.nvim" })
  use({ "saadparwaiz1/cmp_luasnip" })
  use({ "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim" })
  use({ "glepnir/lspsaga.nvim", branch = "main" })
  use({ "lukas-reineke/lsp-format.nvim" })
  use({
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
    end
  })

  -- Tests
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      'haydenmeade/neotest-jest',
    }
  }

  -- Jumps
  use({ "ThePrimeagen/harpoon" })
  use({
    "ggandor/leap.nvim",
    config = function()
      require("leap").set_default_keymaps()
    end
  })
  use({
    "ggandor/leap-spooky.nvim",
    config = function()
      require("leap-spooky").setup({
        paste_on_remote_yank = true,
      })
    end
  })

  use({ "L3MON4D3/LuaSnip" })

  use({
    "terrortylor/nvim-comment",
    config = function()
      require('nvim_comment').setup()
    end
  })
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end
  })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  })
  use({ "mrjones2014/smart-splits.nvim" })
  use({
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({
        handlers = {
          gitsigns = true,
        },
      })
    end
  })
  use({
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({
        next = "m]",
        preview = "m[",
      })
    end
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto'
        }
      }
    end
  })

  -- Look & feel
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  })
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  })
  use({
    "m-demare/hlargs.nvim",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("hlargs").setup()
    end
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)

require("plugins.configs.material")
require("plugins.configs.telescope")
require("plugins.configs.lspconfig")
require("plugins.configs.snippets")
require("plugins.configs.neotest")
require("plugins.configs.gitsigns")

return packer
