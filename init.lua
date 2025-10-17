-- ~/.config/nvim/init.lua

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Ensure ~/.local/bin is on PATH for this Neovim session
do
  local home_local_bin = vim.fn.expand('~/.local/bin')
  if home_local_bin ~= '' and not string.find(':' .. (vim.env.PATH or '') .. ':', ':' .. home_local_bin .. ':', 1, true) then
    vim.env.PATH = (vim.env.PATH or '') .. ':' .. home_local_bin
  end
end

-- Load basic settings (options, keymaps)
-- These files will be executed before the plugin is loaded.
require('config.options')
require('config.keymaps')
require('config.diagnostics')

-- Load plugin manager Lazy.nvim
-- This file will load and configure all plugins.
require('config.lazy')
require('config.autocmds')
