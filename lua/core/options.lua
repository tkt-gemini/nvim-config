-- ~/.config/nvim/lua/config/options.lua

local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- UI
opt.laststatus = 3
opt.wrap = true
opt.termguicolors = true
opt.signcolumn = 'yes'
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Behavior
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.clipboard = 'unnamedplus'     -- Use system clipboard

-- Folding
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.foldlevel = 99
opt.fillchars:append({ fold = ' ' })
opt.foldtext = 'v:lua.custom_foldtext()'

function _G.custom_foldtext()
  local firstLine = vim.fn.getline(vim.v.foldstart)
  local lineCount = vim.v.foldend - vim.v.foldstart + 1
  local icon = ''
  local text = vim.fn.substitute(firstLine, [[^\s*]], '', '')
  local final_text = string.format('%s %s...(%d lines)', icon, text, lineCount)

  return final_text
end
