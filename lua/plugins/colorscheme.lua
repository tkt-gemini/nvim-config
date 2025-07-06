-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    'folke/tokyonight.nvim',
    lazy = false, -- Tải ngay khi khởi động
    priority = 1000, -- Ưu tiên tải trước các plugin khác
    opts = {
      transparent = true
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      -- Tải colorscheme
      vim.cmd.colorscheme 'tokyonight-storm'
    end,
  },
}
