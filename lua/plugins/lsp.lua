-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.on_attach(function(client, bufnr)
        -- Tạo keymaps cho LSP khi nó attach vào buffer
        -- Xem thêm các keymap tại: :help lsp-zero-keybindings
        lsp_zero.default_keymaps({buffer = bufnr})

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP: Go to Definition' })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: Hover' })
        vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, { desc = 'LSP: Workspace Symbol' })
        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, { desc = 'LSP: View Diagnostics' })
        vim.keymap.set('n', '[d', vim.diagnostic.goto_next, { desc = 'LSP: Next Diagnostic' })
        vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, { desc = 'LSP: Previous Diagnostic' })
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, { desc = 'LSP: Code Action' })
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, { desc = 'LSP: References' })
        vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, { desc = 'LSP: Rename' })
      end)
      
      -- Cấu hình mason để quản lý LSP server, linter, formatter
      require('mason').setup({})
      require('mason-lspconfig').setup({
        -- Đảm bảo các LSP server này được cài đặt
        ensure_installed = {
          'lua_ls',
          'pyright', -- for Python
          'typescript-language-server', -- for Javascript/TypeScript
          'rust_analyzer', -- for Rust
        },
        handlers = {
          lsp_zero.default_setup,
        },
      })
    end
  }
}
