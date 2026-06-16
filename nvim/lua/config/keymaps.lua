-- insert mode escape
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')

-- quick quit/write
vim.keymap.set('n', 'q', '<Cmd>q<CR>', { desc = 'Quit' })
vim.keymap.set('n', 'Q', '<Cmd>wq<CR>', { desc = 'Write & quit' })
vim.keymap.set('n', 'W', '<Cmd>w<CR>', { desc = 'Write' })

-- clear search highlight
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to upper window' })

-- terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-h>', '<Cmd>wincmd h<CR>')
vim.keymap.set('t', '<C-l>', '<Cmd>wincmd l<CR>')
vim.keymap.set('t', '<C-j>', '<Cmd>wincmd j<CR>')
vim.keymap.set('t', '<C-k>', '<Cmd>wincmd k<CR>')

-- diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic quickfix list' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' })
