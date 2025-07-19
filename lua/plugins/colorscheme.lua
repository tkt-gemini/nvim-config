-- ~/.config/nvim/lua/plugins/colorscheme.lua
local themes = {
  tokyonight = {
    repo = 'folke/tokyonight.nvim',
    opts = {
      transparent = true
    },
  },
  dracula = {
    repo = 'Mofiqul/dracula.nvim',
    opts = {
      color_palette = 'soft',
      transparent_bg = true,
      italic_comment = true,
    },
  },
}

local activeThemeName = 'dracula'
local activeTheme = themes[activeThemeName]

return {
  activeTheme.repo,
  lazy = false,
  priority = 1000,
  opts = activeTheme.opts,
  config = function (_, opts)
    vim.cmd.colorscheme(activeThemeName)
  end
}
