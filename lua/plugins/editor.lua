-- ~/.config/nvim/lua/plugins/editor.lua
return {
  -- Auto-close pairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

  -- Comment with `gcc` (line) or `gc` (motion)
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },

  -- Git signs in sign column
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  -- Integrated terminal
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require('toggleterm').setup({
        open_mapping = [[<c-\>]], -- Toggle with Ctrl+\
        direction = 'float',
      })
    end
  },

  -- Fuzzy finding
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = {
      defaults = {
        selection_caret = ' ',
        prompt_prefix = ' ',
        path_display = { 'smart' },
        preview = {
          filesize_limit = 10,
          files = {
            '*.md',
            '*.txt',
          },
        },
        file_ignore_patterns = {
          "node_modules",
          "%.lock",
          "%.git/",
          "build/",
          "dist/",
          "vendor/"
        },
      },
    },
    config = function(_, opts)
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      telescope.setup(opts)
      telescope.load_extension('fzf')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help Tags' })
    end
  },
}
