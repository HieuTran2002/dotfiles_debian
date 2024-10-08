local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>gD', builtin.lsp_definitions, {})

vim.keymap.set('n', '<leader>fc', builtin.lsp_dynamic_workspace_symbols, {})

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.keymap.set('n', '<leader>lf', builtin.diagnostics, {})

vim.keymap.set('n', '<leader>bb', builtin.buffers, {})


require('telescope').setup{ 
    defaults = { 
        file_ignore_patterns = {"__pycache__", "env", "build"},
        mappings = {
            i = {
                ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-S-d>"] = actions.delete_buffer,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        }
    } 
}
