require("nvim-treesitter.configs").setup {
  markid = { enable = true },
  matchup = { enable = true },
  autotag = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["it"] = "@parameter.outer",
        ["at"] = "@parameter.inner",
      },
    },
  },
}
