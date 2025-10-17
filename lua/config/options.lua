-- ~/.config/nvim/lua/config/options.lua

local opt = vim.opt -- Shorthand for vim.opt

-- Line numbers
opt.relativenumber = true -- Show relative line numbers
opt.number = true         -- Show absolute number on current line

-- Indentation
opt.tabstop = 2       -- Visual width of a <Tab>
opt.softtabstop = 2   -- Spaces inserted when pressing <Tab>
opt.shiftwidth = 2    -- Indent width for auto-indent
opt.expandtab = true  -- Use spaces instead of tabs
opt.smartindent = true -- Smart auto-indenting on new lines
opt.autoindent = true  -- Keep indent from current line

-- UI
opt.laststatus = 3
opt.wrap = true -- Wrap long lines
opt.termguicolors = true -- Enable 24-bit colors
opt.signcolumn = 'yes' -- Always show sign column
opt.scrolloff = 8 -- Keep 8 lines visible above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns visible left/right

-- Search
opt.hlsearch = true  -- Highlight search matches
opt.incsearch = true -- Live incremental searching
opt.ignorecase = true -- Case-insensitive by default
opt.smartcase = true  -- Case-sensitive if pattern has uppercase

-- Behavior
opt.undofile = true               -- Persist undo history
opt.swapfile = false              -- Disable swap files
opt.backup = false                -- Disable backup files
opt.updatetime = 250              -- CursorHold update time (ms)
opt.timeoutlen = 300              -- Mapped sequence timeout (ms)
opt.splitright = true             -- Vertical splits open to the right
opt.splitbelow = true             -- Horizontal splits open below
opt.clipboard = 'unnamedplus'     -- Use system clipboard

-- Folding
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 99 -- Open all folds by default
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

-- Center cursor when searching or paging
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
