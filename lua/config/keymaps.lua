-- ~/.config/nvim/lua/config/keymaps.lua

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window navigation
keymap('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- Window resize
keymap('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
keymap('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
keymap('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
keymap('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Buffer navigation
keymap('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
keymap('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Close buffer
keymap('n', '<leader>q', ':bdelete<CR>', { desc = 'Close current buffer' })

-- Clear search highlights
keymap('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- Save file
keymap('n', '<leader>w', ':w<CR>', { desc = 'Save file' })

-- Quit
keymap('n', '<leader>x', ':q<CR>', { desc = 'Quit' })
keymap('n', '<leader>X', ':qa<CR>', { desc = 'Quit All' })

-- Move line/block
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Select all text
keymap('n', '<C-a>', 'ggVG', { desc = 'Select all text' })

-- Quickfix and location list navigation
keymap('n', '<leader>co', ':copen<CR>', { desc = 'Open quickfix list' })
keymap('n', '<leader>cc', ':cclose<CR>', { desc = 'Close quickfix list' })
keymap('n', '<leader>cn', ':cnext<CR>', { desc = 'Next quickfix item' })
keymap('n', '<leader>cp', ':cprev<CR>', { desc = 'Previous quickfix item' })
keymap('n', '<leader>lo', ':lopen<CR>', { desc = 'Open location list' })
keymap('n', '<leader>lc', ':lclose<CR>', { desc = 'Close location list' })
keymap('n', '<leader>ln', ':lnext<CR>', { desc = 'Next location item' })
keymap('n', '<leader>lp', ':lprev<CR>', { desc = 'Previous location item' })
