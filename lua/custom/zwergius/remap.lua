function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Easy save with CTRL + s
Map('n', '<C-s>', ':update<cr>', { desc = 'Save buffer' })
Map({ 'i', 'v' }, '<C-s>', '<Esc>:update<cr>', { desc = 'Save buffer' })

-- Split Movement
-- Map('n', '<C-h>', '<C-w>h', { desc = 'Move focus left' })
-- Map('n', '<C-j>', '<C-w>j', { desc = 'Move focus up' })
-- Map('n', '<C-k>', '<C-w>k', { desc = 'Move focus down' })
-- Map('n', '<C-l>', '<C-w>l', { desc = 'Move focus right' })

-- Jump and keep cursor in the middle
Map('n', '<C-d>', '<C-d>zz', { desc = 'Move down & center' })
Map('n', '<C-u>', '<C-u>zz', { desc = 'Move up & center' })

-- Keep searchterms in the middle
Map('n', 'n', 'nzzzv')
Map('n', 'N', 'Nzzzv')

-- Paste over visually selected maintaining clipboard
Map('x', '<leader>p', [["_dP]])

-- Remove search highlight until next search
Map('n', '<leader>h', ':nohlsearch<CR>', { desc = 'No Highlight' })
