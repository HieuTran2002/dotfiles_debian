require('lspsaga').setup({})

vim.keymap.set('n', '<leader>gd', ':Lspsaga peek_definition<CR>')
vim.keymap.set('n', '<leader>ln', ':Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set('n', '<leader>lf', ':Lspsaga show_buf_diagnostics<CR>')
vim.keymap.set('n', '<leader>gr', ':Lspsaga rename<CR>')
-- vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
