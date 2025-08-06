-- ~/.config/nvim/lua/plugins/notebook.lua
return {
  'benlubas/molten-nvim',
  version = '^1.0.0', -- Lock to version 1 to avoid breaking changes
  dependencies = { '3rd/image.nvim' },
  build = ':UpdateRemotePlugins',
  ft = { 'python', 'julia', 'r', 'markdown' },
  init = function()
    vim.g.molten_cell_delimiter = "^# %%%%?"
    vim.g.molten_auto_open_output = true       -- Tự động mở cửa sổ output
    vim.g.molten_image_provider = 'image.nvim' -- Dùng image.nvim để hiển thị ảnh
    vim.g.molten_output_win_max_height = 20    -- Đặt chiều cao tối đa cho cửa sổ output
  end,
  keys = {
    { '<leader>mi', '<cmd>MoltenInit<CR>',             desc = 'Molten: Initialize Kernel' },
    { '<leader>md', '<cmd>MoltenDeinit<CR>',           desc = 'Molten: De-initialize' },
    { '<leader>mI', '<cmd>MoltenInterrupt<CR>',        desc = 'Molten: Interrupt Kernel' },
    { '<leader>mr', '<cmd>MoltenEvaluateOperator<cr>', mode = 'n',                         desc = 'Molten: Run (Operator)' },
    { '<leader>mr', '<cmd>MoltenEvaluateVisual<cr>',   mode = 'v',                         desc = 'Molten: Run Selection' },
    { '<leader>ml', '<cmd>MoltenEvaluateLine<cr>',     desc = 'Molten: Run Line' },
    { '<leader>mR', '<cmd>MoltenReevaluateCell<cr>',   desc = 'Molten: Re-run active cell' },
    { '<leader>mo', '<cmd>MoltenShowOutput<CR>',       desc = 'Molten: Show Output' },
    { '<leader>mh', '<cmd>MoltenHideOutput<CR>',       desc = 'Molten: Hide Output' },
    { '<leader>mn', '<cmd>MoltenNext<CR>',             desc = 'Molten: Next Cell' },
    { '<leader>mp', '<cmd>MoltenPrev<CR>',             desc = 'Molten: Previous Cell' },
  },
}
