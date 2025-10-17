-- ~/.config/nvim/lua/config/autocmds.lua

-- Guard python3 host to avoid breaking when pyenv version changes
do
  local host = vim.fn.expand('$PYENV_ROOT/versions/3.12.9/bin/python')
  if host ~= '' and vim.fn.executable(host) == 1 then
    vim.g.python3_host_prog = host
  end
end
vim.g.loaded_perl_provider = 0

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Format-on-save is handled by Conform.nvim (see plugins/lsp.lua)

-- Python filetype tweaks
autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
  desc = "Set Python indent to 2 spaces"
})
