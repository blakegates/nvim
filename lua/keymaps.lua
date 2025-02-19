-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Copy to clipboard keymaps
vim.keymap.set('v', '<C-S-c>', '"+y', { desc = 'Copy selected text to clipboard' })
vim.keymap.set('n', '<C-S-c>', '"+y', { desc = 'Copy current line to clipboard' })

-- Paste from clipboard keymaps
vim.keymap.set('n', '<C-S-v>', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set('n', '<C-S-V>', '"+P', { desc = 'Paste from clipboard (before cursor)' })

-- Cut to clipboard keymaps
vim.keymap.set('n', '<C-S-x>', '"+d', { desc = 'Cut current line to clipboard' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Floaterminal keymaps
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-\\>', ':Floaterminal<CR>', { desc = 'Open floaterminal' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Split window navigation keymaps
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
