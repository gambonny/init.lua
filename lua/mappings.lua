local keymap = vim.api.nvim_set_keymap
local api = vim.api
local opts = { noremap = true, silent = true }

keymap('n', '<Leader>ev', '<cmd>tabe $MYVIMRC<cr>', opts)

keymap("n", "<leader>w", "<cmd>update<cr>", opts)
keymap("n", "<leader>x", "<cmd>x<cr>", opts)
keymap("n", "<leader>q", "<cmd>q!<cr>", opts)
keymap("n", "<leader>Q", "<cmd>qa!<cr>", opts)

-- Delete a buffer, without closing the window
keymap("n", [[\d]], "<cmd>bprevious <bar> bdelete #<cr>", opts)

-- Keep cursor position after yanking
keymap("n", "y", "myy", opts)
api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = api.nvim_create_augroup("restore_after_yank", { clear = true }),
  callback = function()
    vim.cmd([[
      silent! normal! `y
      silent! delmarks y
    ]])
  end,
})

-- Accelerated jk
keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})

-- Harpoon
keymap("n", "<Leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<Leader>tp", ":Telescope harpoon marks theme=dropdown<CR>", opts)
keymap("n", "[h", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", opts)
keymap("n", "]h", "<cmd>lua require('harpoon.ui').nav_next()<CR>", opts)

-- Neotest
keymap('n', '<Leader>t1', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", opts)
keymap('n', '<Leader>t2', "<cmd>lua require('neotest').run.run()<cr>", opts)
keymap('n', '<Leader>t3', "<cmd>lua require('neotest').summary.toggle()<cr>", opts)
keymap('n', '<Leader>t4', "<cmd>lua require('neotest').output.open()<cr>", opts)
