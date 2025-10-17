-- ~/.config/nvim/lua/plugins/trouble.lua
return {
  -- Trouble.nvim for diagnostics browsing
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>xx', '<cmd>TroubleToggle<cr>', desc = 'Toggle Trouble' },
      { '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Workspace Diagnostics' },
      { '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Document Diagnostics' },
      { '<leader>xl', '<cmd>TroubleToggle loclist<cr>', desc = 'Location List' },
      { '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', desc = 'Quickfix List' },
      { '[q', function()
        if require('trouble').is_open() then
          require('trouble').prev({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end, desc = 'Previous Trouble/Quickfix Item' },
      { ']q', function()
        if require('trouble').is_open() then
          require('trouble').next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end, desc = 'Next Trouble/Quickfix Item' },
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    },
  },
}
