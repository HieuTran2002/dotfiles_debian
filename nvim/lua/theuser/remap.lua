vim.g.mapleader = " "

vim.keymap.set("n", "<leader>v", ":Ex<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- copy
vim.keymap.set("v", '<C-c>', '"+y')

vim.api.nvim_set_keymap('n', '<leader>lf', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>le', '$', { noremap = true, silent = true })


vim.keymap.set('x', '<C-i>', [[:s/\d\+/\=line('.')-line("'<")]])

-- F7 -> build
vim.api.nvim_set_keymap('n', '<F7>', ':!make all<CR>', { noremap = true, silent = true })
--
-- Shift+F7 -> build
vim.api.nvim_set_keymap('n', '<F19>', ':!make rebuild<CR>', { noremap = true, silent = true })

-- F8 -> Flash
vim.api.nvim_set_keymap('n', '<F8>', ':!make flash<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '!', ':!', { noremap = true, silent = false })

-- split
vim.api.nvim_set_keymap('n', '<leader>|', ':vert split<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>_', ':hori split<CR>', { noremap = true, silent = false })

-- F5 -> OpenOCD
vim.api.nvim_set_keymap('n', '<F5>', ':!make openocd<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', ';', '$a;<Esc>', { noremap = true, silent = true });

-- delete buffer
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })
