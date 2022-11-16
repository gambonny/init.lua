vim.api.nvim_set_keymap("n", "<Leader>tp", ":Telescope harpoon marks theme=dropdown<CR>", {})

vim.api.nvim_set_keymap("n", "]h", "<cmd>lua require('harpoon.ui').nav_next()<CR>", {})
vim.api.nvim_set_keymap("n", "[h", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>ty", "<cmd>lua require('harpoon.mark').add_file()<CR>", {})
