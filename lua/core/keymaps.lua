-- ~/.config/nvim/lua/config/keymaps.lua

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")

keymap("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
keymap("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
keymap("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
keymap("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })

-- Window resize
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- nvim-tree keymaps
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })

-- Buffer
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close current buffer" })

-- Clear search highlights
keymap("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- Move highlighted lines/block up/down in visual mode, and keep the selection with proper re-indenting and cursor position
keymap("v", "J", "<cmd>move '>+1<CR>gv-gv", opts)
keymap("v", "K", "<cmd>move '<-2<CR>gv-gv", opts)

-- Select all text
keymap("n", "<C-a>", "ggVG", { desc = "Select all text" })

-- Quickfix and location list navigation
keymap("n", "<leader>co", "<cmd>copen<CR>", { desc = "Open quickfix list" })
keymap("n", "<leader>cc", "<cmd>cclose<CR>", { desc = "Close quickfix list" })
keymap("n", "<leader>cn", "<cmd>cnext<CR>", { desc = "Next quickfix item" })
keymap("n", "<leader>cp", "<cmd>cprev<CR>", { desc = "Previous quickfix item" })
keymap("n", "<leader>lo", "<cmd>lopen<CR>", { desc = "Open location list" })
keymap("n", "<leader>lc", "<cmd>lclose<CR>", { desc = "Close location list" })
keymap("n", "<leader>ln", "<cmd>lnext<CR>", { desc = "Next location item" })
keymap("n", "<leader>lp", "<cmd>lprev<CR>", { desc = "Previous location item" })

-- Center cursor when searching or paging -- also keep search result in the middle even if a folded line is opened
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- molten keymap
keymap("n", "<leader>mi", "<cmd>MoltenInit<CR>", { desc = "Molten: Initialize Kernel" })
keymap("n", "<leader>md", "<cmd>MoltenDeinit<CR>", { desc = "Molten: De-initialize" })
keymap("n", "<leader>mI", "<cmd>MoltenInterrupt<CR>", { desc = "Molten: Interrupt Kernel" })
keymap("n", "<leader>mr", "<cmd>MoltenEvaluateOperator<cr>", { desc = "Molten: Run (Operator)" })
keymap("v", "<leader>mr", "<cmd>MoltenEvaluateVisual<cr>", { desc = "Molten: Run Selection" })
keymap("n", "<leader>ml", "<cmd>MoltenEvaluateLine<cr>", { desc = "Molten: Run Line" })
keymap("n", "<leader>mR", "<cmd>MoltenReevaluateCell<cr>", { desc = "Molten: Re-run active cell" })
keymap("n", "<leader>mo", "<cmd>MoltenShowOutput<CR>", { desc = "Molten: Show Output" })
keymap("n", "<leader>mh", "<cmd>MoltenHideOutput<CR>", { desc = "Molten: Hide Output" })
keymap("n", "<leader>mn", "<cmd>MoltenNext<CR>", { desc = "Molten: Next Cell" })
keymap("n", "<leader>mp", "<cmd>MoltenPrev<CR>", { desc = "Molten: Previous Cell" })
