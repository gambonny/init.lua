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

return require('packer').startup(function(use)
  use ({ "wbthomason/packer.nvim" })

  use({ "nvim-lua/plenary.nvim", commit="4b7e52044bbb84242158d977a50c4cbcd85070c7" })
  use({ "tpope/vim-repeat", commit="24afe922e6a05891756ecf331f39a1f6743d3d5a" })

  use({ 
    "b0o/incline.nvim",
    commit="44d4e6f4dcf2f98cf7b62a14e3c10749fc5c6e35",
    config=function()
      require("incline").setup()
    end
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
