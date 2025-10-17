-- ~/.config/nvim/lua/plugins/ui.lua
return {
  -- Sidebar
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    lazy = true,
    cmd = { 'Neotree' },
    keys = {
      { '<leader>ne', '<cmd>Neotree filesystem toggle<CR>',       desc = 'Toggle NeoTree Filesystem' },
      { '<leader>nb', '<cmd>Neotree buffers toggle<CR>',          desc = 'Toggle NeoTree Buffers' },
      { '<leader>ng', '<cmd>Neotree git_status toggle<CR>',       desc = 'Toggle NeoTree Buffers' },
      { '<leader>ns', '<cmd>Neotree document_symbols toggle<cr>', desc = 'Toggle NeoTree Document symbols' }
    },
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      close_if_last_window = true,    -- If last window: Close
      popup_border_style = 'rounded', -- Create rounded for popup border
      source_selector = {
        winbar = true,
        statusline = false,
        content_layout = 'center',
        tabs_layout = 'equal',
        show_icons = 'always'
      },
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
        },
        -- Config icon
        icon = {
          folder_closed = " ",
          folder_open = " ",
          folder_empty = "󰜌",
          default = "", -- Default icon
          highlight = "NeoTreeFileIcon",
        },
        -- File/folder name
        name = {
          trailing_slash = false,
          use_git_status_colors = true, -- Use git status colors
          highlight = "NeoTreeFileName",
        },
      },
      -- Config for window
      window = {
        position = 'right',
        width = 35,
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
        },
      },
    },

    config = function(_, opts)
      require('neo-tree').setup(opts)
    end,

    -- Keys moved above to enable lazy-loading on keypress
  },

  {
    "kdheepak/lazygit.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'auto',
        icons_enabled = true,
        component_separators = '•',
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
      },
      sections = {
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_y = {},
        lualine_z = {}
      },
      extensions = { 'neo-tree', 'toggleterm' },
    },
    config = function(_, opts)
      local function locationSection()
        local line = vim.fn.line('.')
        local col = vim.fn.col('.')
        return string.format("%d, %d", line, col)
      end

      local function indentSection()
        local expandtab = vim.bo.expandtab
        local tabstop = vim.bo.tabstop
        local shiftwidth = vim.bo.shiftwidth

        if expandtab then
          return string.format("Spaces: %d", shiftwidth)
        else
          return string.format("Tabs: %d", tabstop)
        end
      end

      opts.sections.lualine_y = { indentSection }
      opts.sections.lualine_z = { locationSection }
      opts.inactive_sections.lualine_y = { indentSection }
      opts.inactive_sections.lualine_z = { locationSection }

      require('lualine').setup(opts)
    end,
  },

  -- Better syntax highlighting with Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "javascript",
          "typescript",
          "python",
          "html",
          "css",
          "go"
        },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { 
          enable = true,
          disable = { "python", "yaml" } -- Disable for languages with poor indent support
        },
      })
    end
  },

  -- Indentation
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = { enabled = true },
    },
  },
}
