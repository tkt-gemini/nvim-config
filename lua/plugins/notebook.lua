-- ~/.config/nvim/lua/plugins/notebook.lua
return {
  {
    "3rd/image.nvim",
    build = false, -- Không build rock, dùng magick_cli
    opts = {
      backend = "kitty",
      processor = "magick_cli", -- Dùng CLI của ImageMagick
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
        neorg = {
          enabled = true,
          filetypes = { "norg" },
        },
      },
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      tmux_show_only_in_active_window = true,
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
    }
  },

  {
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
  },
}
