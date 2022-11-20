local keymap = vim.api.nvim_set_keymap
local api = vim.api
local opts = { noremap = true, silent = true }

keymap('n', '<leader>ev', '<cmd>tabe $MYVIMRC<cr>', opts)

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
keymap('n', 'j', '<plug>(accelerated_jk_gj)', {})

-- Harpoon
keymap("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "[h", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)
keymap("n", "]h", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)

-- Neotest
keymap("n", "<leader>t1", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", opts)
keymap("n", "<leader>t2", "<cmd>lua require('neotest').run.run()<cr>", opts)
keymap("n", "<leader>t3", "<cmd>lua require('neotest').summary.toggle()<cr>", opts)
keymap("n", "<leader>t4", "<cmd>lua require('neotest').output.open()<cr>", opts)

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = true })
    end

    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
    bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
    bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
    bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
    bufmap("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
    bufmap("n", "<leader>gv", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>")
    bufmap("n", "<leader>gg", "<cmd>belowright split | lua vim.lsp.buf.definition()<cr>")
  end
})

-- LSP Saga
keymap("n", "<leader>gh", "<cmd>Lspsaga lsp_finder<cr>", opts)
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
keymap("n", "<leader>gd", "<cmd>Lspsaga peek_definition<cr>", opts)
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)

keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

keymap("n", "<leader>o", "<cmd>LSoutlineToggle<cr>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)

keymap("n", "<A-t>", "<cmd>Lspsaga open_floaterm<cr>", opts)
keymap("t", "<A-t>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<cr>]], opts)

-- Smart Splits
keymap("n", "<A-y>", "<cmd>lua require('smart-splits').resize_left()<cr>", opts)
keymap("n", "<A-u>", "<cmd>lua require('smart-splits').resize_down()<cr>", opts)
keymap("n", "<A-i>", "<cmd>lua require('smart-splits').resize_up()<cr>", opts)
keymap("n", "<A-o>", "<cmd>lua require('smart-splits').resize_right()<cr>", opts)

keymap("n", "<A-h>", "<cmd>lua require('smart-splits').move_cursor_left()<cr>", opts)
keymap("n", "<A-j>", "<cmd>lua require('smart-splits').move_cursor_down()<cr>", opts)
keymap("n", "<A-k>", "<cmd>lua require('smart-splits').move_cursor_up()<cr>", opts)
keymap("n", "<A-l>", "<cmd>lua require('smart-splits').move_cursor_right()<cr>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>tm", ":Telescope marks<cr>", opts)
keymap("n", "<leader>tg", ":Telescope grep_string<cr>", opts)
keymap("n", "<leader>tl", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>tf", ":Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<leader>tc", ":Telescope git_commits<cr>", opts)
keymap("n", "<leader>ti", ":Telescope git_bcommits<cr>", opts)
keymap("n", "<leader>ts", ":Telescope git_status<cr>", opts)
keymap("n", "<leader>ta", ":Telescope command_history<cr>", opts)
keymap("n", "<leader>tb", ":Telescope buffers theme=dropdown<cr>", opts)
keymap("n", "<leader>tj", ":Telescope jumplist theme=dropdown<cr>", opts)

-- Telescope plugins
keymap("n", "<leader>tt", ":Telescope treesitter theme=dropdown<cr>", opts)
keymap("n", "<leader>th", ":Telescope harpoon marks theme=dropdown<cr>", opts)

-- Opening GH
keymap("n", "<leader>ho", ":OpenInGHRepo <cr>", opts)
keymap("n", "<leader>hf", ":OpenInGHFile <cr>", opts)

-- Zen Mode
keymap("n", "<A-z>", ":ZenMode<cr>", opts)
