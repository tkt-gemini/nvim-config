-- ~/.config/nvim/lua/config/autocmds.lua

vim.g.python3_host_prog = '$PYENV_ROOT/versions/nvim-env/bin/python'
vim.g.loaded_perl_provider = 0

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local format_group = augroup("FormatOnSave", { clear = true })
autocmd("BufWritePre", {
  group = format_group,
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
  desc = "Format file before saving",
})

-- autocmd for python
autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
  desc = "Set python indent to 2 spaces"
})
