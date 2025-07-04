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
        lsp_zero.default_keymaps({buffer = bufnr})
        -- Custom keymaps
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

      -- Cấu hình mason
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'pyright',
          'rust_analyzer',
          'ts_ls',
          'clangd',
        },
        handlers = {
          -- Handler mặc định cho các LSP không có cấu hình riêng
          lsp_zero.default_setup,

          -- Cấu hình riêng cho lua_ls
          lua_ls = function()
            local lspconfig = require('lspconfig')
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup {
              capabilities = capabilities,

              settings = {
                Lua = {
                  runtime = {
                    version = 'LuaJIT',
                  },

                  diagnostics = {
                    globals = { 'vim', 'use', 'require', 'hs' }
                  },

                  workspace = {
                    library = {
                      -- Load API of Neovim
                      [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                      -- Load file .lua in config
                      [vim.fn.stdpath('config') .. '/lua'] = true,
                    }
                  }
                }
              }
            }
          end,

          -- Cấu hình riêng cho pyright (Python)
          pyright = function()
            require('lspconfig').pyright.setup({
              settings = {
                python = {
                  analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = "basic"
                  }
                }
              }
            })
          end,

          -- Cấu hình riêng cho rust_analyzer
          rust_analyzer = function()
            require('lspconfig').rust_analyzer.setup({
              settings = {
                ['rust-analyzer'] = {
                  cargo = {
                    allFeatures = true,
                  },
                  checkOnSave = {
                    command = "clippy",
                  },
                  procMacro = {
                    enable = true,
                  },
                }
              }
            })
          end,

          -- Cấu hình riêng cho TypeScript/JavaScript
          ts_ls = function()
            require('lspconfig').ts_ls.setup({
              settings = {
                typescript = {
                  inlayHints = {
                    includeInlayParameterNameHints = 'all',
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                  }
                },
                javascript = {
                  inlayHints = {
                    includeInlayParameterNameHints = 'all',
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                  }
                }
              }
            })
          end,

          -- Cấu hình riêng cho C/C++
          clangd = function()
            require('lspconfig').clangd.setup({
              cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=iwyu",
                "--completion-style=detailed",
                "--function-arg-placeholders",
                "--fallback-style=llvm",
              },
              init_options = {
                usePlaceholders = true,
                completeUnimported = true,
                clangdFileStatus = true,
              },
            })
          end,
        },
      })
    end
  }
}
