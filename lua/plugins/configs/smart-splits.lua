vim.keymap.set('n', '<A-y>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-u>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-i>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-o>', require('smart-splits').resize_right)

vim.keymap.set('n', '<A-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').move_cursor_right)
