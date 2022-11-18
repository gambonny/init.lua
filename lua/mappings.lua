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

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
    bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
    bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
    bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
    bufmap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
    bufmap("n", "<Leader>gv", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>")
    bufmap("n", "<Leader>gg", "<cmd>belowright split | lua vim.lsp.buf.definition()<CR>")
  end
})

-- LSP Saga
keymap("n", "<Leader>gh", "<cmd>Lspsaga lsp_finder<cr>", opts)
keymap("n", "<Leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
keymap("n", "<Leader>rn", "<cmd>Lspsaga rename<cr>", opts)
keymap("n", "<Leader>gd", "<cmd>Lspsaga peek_definition<cr>", opts)
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)

keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

keymap("n", "<leader>o", "<cmd>LSoutlineToggle<cr>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)

keymap("n", "<A-t>", "<cmd>Lspsaga open_floaterm<cr>", opts)
keymap("t", "<A-t>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<cr>]], opts)
