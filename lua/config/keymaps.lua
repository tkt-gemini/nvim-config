-- ~/.config/nvim/lua/config/keymaps.lua

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Di chuyển giữa các cửa sổ (split)
keymap('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- Thay đổi kích thước cửa sổ
keymap('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
keymap('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
keymap('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
keymap('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Di chuyển qua lại giữa các buffer
keymap('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
keymap('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Đóng buffer
keymap('n', '<leader>q', ':bdelete<CR>', { desc = 'Close current buffer' })

-- Xóa highlight tìm kiếm
keymap('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- Lưu file
keymap('n', '<leader>w', ':w<CR>', { desc = 'Save file' })

-- Thoát
keymap('n', '<leader>x', ':q<CR>', { desc = 'Quit' })
keymap('n', '<leader>X', ':qa<CR>', { desc = 'Quit All' })

-- Di chuyển dòng/khối code
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

--
keymap('n', '<C-d>', 'bve', opts)
keymap('n', '<C-a>', 'ggVG', opts)
