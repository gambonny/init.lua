require('nvim-tundra').setup({
  transparent_background = true,
  dim_inactive_windows = {
    enabled = true,
    color = nil,
  },
  plugins = {
    lsp = true,
    treesitter = true,
    cmp = true,
    gitsigns = true,
    telescope = true,
  },
  overwrite = {
    colors = {},
    highlights = {},
  },
})
