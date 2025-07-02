-- ~/.config/nvim/lua/config/options.lua

local opt = vim.opt -- Viết tắt cho vim.opt để code gọn hơn

-- SỐ DÒNG
opt.relativenumber = true -- Hiển thị số dòng tương đối
opt.number = true         -- Hiển thị số dòng hiện tại

-- INDENT (THỤT LỀ)
opt.tabstop = 2       -- Số lượng dấu cách cho một tab
opt.softtabstop = 2   -- Số lượng dấu cách khi nhấn Tab
opt.shiftwidth = 2    -- Số lượng dấu cách cho auto-indent
opt.expandtab = true  -- Chuyển Tab thành dấu cách
opt.smartindent = true -- Thụt lề thông minh cho dòng mới
opt.autoindent = true  -- Tự động thụt lề

-- GIAO DIỆN
opt.wrap = true -- Không tự động xuống dòng khi dòng quá dài
opt.termguicolors = true -- Bật màu 24-bit (quan trọng cho themes)
opt.signcolumn = 'yes' -- Luôn hiển thị cột sign (cho LSP, Git signs)
opt.scrolloff = 8 -- Giữ 8 dòng context ở trên và dưới khi cuộn
opt.sidescrolloff = 8 -- Tương tự cho cuộn ngang

-- TÌM KIẾM
opt.hlsearch = true  -- Highlight các kết quả tìm kiếm
opt.incsearch = true -- Hiển thị kết quả ngay khi đang gõ
opt.ignorecase = true -- Bỏ qua hoa/thường khi tìm kiếm
opt.smartcase = true  -- Nhưng sẽ phân biệt nếu có chữ hoa trong mẫu tìm kiếm

-- HÀNH VI
opt.undofile = true               -- Bật undo-tree persistent (lưu lịch sử undo sau khi tắt)
opt.swapfile = false              -- Tắt swap file
opt.backup = false                -- Tắt file backup
opt.updatetime = 250              -- Thời gian chờ trước khi ghi cursorhold event (ms)
opt.timeoutlen = 300              -- Thời gian chờ cho key sequence (ms)
opt.splitright = true             -- Mở split mới sang bên phải
opt.splitbelow = true             -- Mở split mới xuống dưới
opt.clipboard = 'unnamedplus'     -- Đồng bộ clipboard hệ thống

-- GẤP CODE (FOLDING)
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 99 -- Mở tất cả các fold khi mở file

-- Đặt con trỏ vào giữa màn hình khi tìm kiếm hoặc di chuyển trang
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
