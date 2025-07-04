-- ~/.config/nvim/lua/plugins/ui.lua
return {
  -- Sidebar
  -- File explorer
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      -- Nếu không có dòng này, neo-tree có thể không chạy
      vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
      vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
      vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

      require('neo-tree').setup({
        -- Đóng neo-tree nếu nó là buffer cuối cùng còn lại
        close_if_last_window = true,
        popup_border_style = 'rounded',
        -- Cho phép xem trước file khi di chuyển con trỏ
        enable_preview = true,
        -- Cấu hình chung cho cửa sổ
        window = {
          position = 'left',
          width = 30,
          mappings = {
            ['<space>'] = 'none', -- Vô hiệu hóa phím space mặc định
            ['e'] = 'toggle_expand_all',
            ['o'] = 'open',
            ['a'] = 'add',
            ['d'] = 'delete',
            ['r'] = 'rename',
            ['c'] = 'copy',
            ['p'] = 'paste',
            ['x'] = 'cut',
            ['?'] = 'show_help',
          },
        },
        -- Cấu hình cho từng nguồn dữ liệu
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          follow_current_file = {
            enabled = true, -- Tự động focus vào file đang mở
          },
        },
        -- Nguồn "Buffers" để xem các file đang mở
        buffers = {
          follow_current_file = {
            enabled = true,
          },
        },
        -- Nguồn "Git Status"
        git_status = {
          window = {
            position = 'float', -- Hiển thị dưới dạng cửa sổ nổi cho đẹp
          },
        },
      })

      -- ĐỊNH NGHĨA KEYMAPS ĐỂ GỌI SIDEBAR ĐA NĂNG
      local keymap = vim.keymap.set
      -- Mở/đóng cây thư mục
      keymap('n', '<leader>e', ':Neotree filesystem toggle<CR>', { desc = 'Toggle NeoTree Filesystem' })
      -- Mở danh sách buffer
      keymap('n', '<leader>b', ':Neotree buffers toggle<CR>', { desc = 'Toggle NeoTree Buffers' })
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "Lazygit",
      "LazygitConfig",
      "LazygitCurrentFile",
      "LazygitFilter",
      "LazygitFilterCurrentFile",
    },
    -- Tùy chọn: bạn có thể thêm các dependency nếu cần
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- Tùy chọn: Cấu hình phím tắt để mở
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Lazygit" },
    },
  },

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'tokyonight',
          icons_enabled = true,
          component_separators = { left = '•', right = '•'},
          section_separators = { left = '', right = ''},
        },
        sections = {
          lualine_c = {
            {'filename', file_status = true, path = 1}
          },
        }
      }
    end,
  },

  -- Syntax highlighting tốt hơn với Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "python", "html", "css", "go" },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
  },
}
