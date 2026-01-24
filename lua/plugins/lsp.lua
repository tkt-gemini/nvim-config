-- ~/.config/nvim/lua/plugins/lsp.lua

return {
	-- Installaiton 
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"ts_ls",
				"clangd",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
      config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local servers = {
          pyright = {
            cmd = { "pyright-langserver", "--stdio" },
            filetypes = { "python" },
            root_markers = { "pyproject.toml", "setup.py", ".git", ".pixi" },
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = "basic",
                  autoSearchPaths = true,
                  useLibraryCodeForTypes = true,
                }
              }
            }
          },

          clangd = {
            cmd = { "clangd", "--background-index", "--clang-tidy" },
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
            root_markers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", ".git" },
          },

          lua_ls = {
            cmd = { "lua-language-server" },
            filetypes = { "lua" },
            root_markers = { ".luarc.json", ".git" },
            settings = {
              Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim" } },
                workspace = {
                  checkThirdParty = false,
                  library = { vim.env.VIMRUNTIME },
                },
              },
            },
          },
        }

        for name, config in pairs(servers) do
          config.capabilities = capabilities
          vim.lsp.config(name, config)
          vim.lsp.enable(name)
        end

        vim.api.nvim_create_autocmd('LspAttach', {
          callback = function(args)
            -- local client = vim.lsp.get_client_by_id(args.data.client_id)
            local opts = { buffer = args.buf }

            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          end,
        })
      end,
	},
}
