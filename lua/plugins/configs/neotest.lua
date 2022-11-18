require('neotest').setup({
  adapters = {
    require('neotest-jest')({
      jestCommand = "yarn test -u",
      cwd = function()
        return vim.fn.getcwd()
      end,
    }),
  },
  icons = {
    failed = "",
    passed = "",
    running = "",
    skipped = "",
    unknown = ""
  }
})
vim.keymap.set('n', '<Leader>t1', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>")
vim.keymap.set('n', '<Leader>t2', "<cmd>lua require('neotest').run.run()<CR>")
vim.keymap.set('n', '<Leader>t3', "<cmd>lua require('neotest').summary.toggle()<CR>")
vim.keymap.set('n', '<Leader>t4', "<cmd>lua require('neotest').output.open()<CR>")
