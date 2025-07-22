vim.g.python3_host_prog = '~/.pyenv/versions/nvim-env/bin/python'
vim.g.loaded_perl_provider = 0

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
