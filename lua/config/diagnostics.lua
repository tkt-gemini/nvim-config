-- ~/.config/nvim/lua/config/diagnostics.lua

-- Global diagnostics sign icons (shown in sign column)
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚",
      [vim.diagnostic.severity.WARN]  = "󰀪",
      [vim.diagnostic.severity.INFO]  = "󰋽",
      [vim.diagnostic.severity.HINT]  = "󰌶",
    }
  }
})


