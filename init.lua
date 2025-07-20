-- ~/.config/nvim/init.lua

-- Đặt leader key TRƯỚC TIÊN. ' ' (phím space) là lựa chọn phổ biến nhất.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Tải các thiết lập cơ bản (options, keymaps)
-- Các file này sẽ được thực thi trước khi plugin được tải.
require('config.options')
require('config.keymaps')

-- Khởi động trình quản lý plugin Lazy.nvim
-- File này sẽ tải và cấu hình tất cả các plugin.
require('config.lazy')
require('config.auto-cmp')
