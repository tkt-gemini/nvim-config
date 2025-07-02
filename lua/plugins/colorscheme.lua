-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    'folke/tokyonight.nvim',
    lazy = false, -- Tải ngay khi khởi động
    priority = 1000, -- Ưu tiên tải trước các plugin khác
    config = function()
      -- Tải colorscheme
      vim.cmd.colorscheme 'tokyonight-storm'
    end,
  },
}
