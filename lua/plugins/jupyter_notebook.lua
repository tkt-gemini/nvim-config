-- ~/.config/nvim/lua/plugins/jukit.lua

return {
  'luk400/vim-jukit',

  -- Tải plugin khi mở file python hoặc gõ lệnh Jukit
  ft = { 'python', 'julia', 'r' },
  cmd = { 'Jukit', 'JukitConnect', 'JukitOutput' },

  -- Plugin này có thể yêu cầu bước build sau khi cài đặt
  build = ':UpdateRemotePlugins',

  config = function()
    -- Các thiết lập tùy chọn cho jukit
    -- Ví dụ: tự động mở cửa sổ output khi chạy code
    vim.g.jukit_auto_show_output = 1

    -- Tùy chọn để hiển thị kết quả trong cửa sổ nổi (floating window)
    vim.g.jukit_output_kind = 'floating'
  end,

  keys = {
    -- Gán phím tắt ở đây để dễ quản lý
    { '<leader>jc', '<cmd>JukitConnect<CR>',    desc = 'Jukit: Connect to Kernel' },
    { '<leader>jd', '<cmd>JukitDisconnect<CR>', desc = 'Jukit: Disconnect' },
    { '<leader>jr', '<cmd>JukitRunCell<CR>',    mode = { 'n', 'v' },              desc = 'Jukit: Run Cell' },
    { '<leader>jl', '<cmd>JukitRunLine<CR>',    mode = { 'n', 'v' },              desc = 'Jukit: Run Line' },
    { '<leader>jo', '<cmd>JukitOutput<CR>',     desc = 'Jukit: Show Output' },
  },
}
