-- ~/.config/nvim/lua/plugins/notebook.lua

return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, 
    opts = {
      rocks = { "magick" },
    },
  },

  {
    "3rd/image.nvim",
    dependencies = { "leafo/magick" },
    opts = {
      backend = "kitty", -- "kitty", "sixel", "iterm2", etc.: Always use the kitty
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki", "quarto" },
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = nil,
      window_overlap_clear_enabled = false,
      kitty_method = "normal",
      screen_resolution_extraction_method = "terminal_graphics_device_attributes",
    },
  },

  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    dependencies = { "3rd/image.nvim" },
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_screen = false
      vim.g.molten_wrap_output = true
    end,
  },

  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "neovim/nvim-lspconfig",
      "benlubas/molten-nvim",
    },
    ft = { "quarto", "markdown" },
    keys = {
      { "<leader>rc", function() require("quarto.runner").run_cell() end, desc = "Run Cell" },
      { "<leader>ra", function() require("quarto.runner").run_all() end, desc = "Run All Cells" },
    },
    opts = {
      codeRunner = {
        enabled = true,
        default_method = "molten",
      },
    },
  },

  {
    "jmbuhr/otter.nvim",
    config = true,
  },
}
