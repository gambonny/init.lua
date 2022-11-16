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

require("plugin-config/material")

return require('packer').startup(function(use)
  use ({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/plenary.nvim", commit="4b7e52044bbb84242158d977a50c4cbcd85070c7" })
   use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config=function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "typescript", "lua", "tsx" },
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
    commit="44d4e6f4dcf2f98cf7b62a14e3c10749fc5c6e35",
    config=function()
      require("incline").setup()
    end
  })
  use({
    "lukas-reineke/indent-blankline.nvim",
    commit="db7cbcb40cc00fc5d6074d7569fb37197705e7f6",
    config=function()
      require("indent_blankline").setup {
      show_current_context = true,
      show_current_context_start = true,
    }
    end
  })

  use({ "tpope/vim-repeat", commit="24afe922e6a05891756ecf331f39a1f6743d3d5a" })
  use({ "psliwka/vim-smoothie", commit="df1e324e9f3395c630c1c523d0555a01d2eb1b7e" })
  
  if packer_bootstrap then
    require('packer').sync()
  end
end)

