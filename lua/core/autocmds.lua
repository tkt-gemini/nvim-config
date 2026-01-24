-- ~/.config/nvim/lua/config/autocmds.lua

-- local augroup = vim.api.nvim_create_augroup
-- local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'rust', 'javascript', 'zig', 'python', 'lua', 'markdown', 'quarto' },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
