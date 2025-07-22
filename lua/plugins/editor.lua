-- ~/.config/nvim/lua/plugins/editor.lua
return {
  -- Tự động đóng ngoặc, ngoặc kép...
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

  -- Comment code dễ dàng với `gcc` (comment 1 dòng) hoặc `gc` + motion
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },

  -- Tích hợp Git, hiển thị các thay đổi ở cột bên trái
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  -- Terminal tích hợp
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require('toggleterm').setup({
        open_mapping = [[<c-\>]], -- Mở terminal bằng Ctrl + \
        direction = 'float',
      })
    end
  },

  -- Fuzzy finding (cực kỳ quan trọng)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = {
      defaults = {
        selection_caret = '❯ ',
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
