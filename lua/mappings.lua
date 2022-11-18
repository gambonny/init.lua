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
