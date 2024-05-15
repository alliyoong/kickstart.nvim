-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
--
-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

--  Set keymap for vim-visual-multi
-- vim.keymap.set('n', '<A-n>', '<Plug>(VM-Find-Under)')

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Paste without overwriting register
vim.keymap.set('v', 'p', '"_dP')

-- Stay in indent mode
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Intellij auto add ;
vim.keymap.set('n', '<C-S-CR>', '<Esc>A;<Esc>')
vim.keymap.set('i', '<C-S-CR>', '<Esc>A;<Esc>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Dismiss noice notification
-- vim.keymap.set('n', '<leader>nd', '<cmd>NoiceDismiss<CR>', { desc = 'Dismiss Noice message' })

-- Resize buffer
vim.keymap.set('n', '<C-S-i>', ':resize +2<CR>', { desc = 'Increase buffer height by 2' })
vim.keymap.set('n', '<C-S-k>', ':resize -2<CR>', { desc = 'Decrease buffer height by 2' })
vim.keymap.set('n', '<C-S-j>', ':vertical resize -2<CR>', { desc = 'Increase buffer width by 2' })
vim.keymap.set('n', '<C-S-l>', ':vertical resize +2<CR>', { desc = 'Decrease buffer width by 2' })
-- vim.keymap.set('n', '<leader>ae', '<C-w>=', { desc = 'Equalize width and height of all buffer' })

-- Disable diagnostic message
vim.diagnostic.config { virtual_text = false }
