-- ~/.config/nvim/lua/plugins/notebook.lua

return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1001,
    opts = {
      rocks = { "magick" },
    },
  },

  -- {
  --   "benlubas/molten-nvim",
  --   version = "^1.0.0",
  --   build = ":UpdateRemotePlugins",
  --   dependencies = { "3rd/image.nvim" },
  --   init = function()
  --     vim.g.molten_image_provider = "image.nvim"
  --     vim.g.molten_output_win_max_height = 20
  --     vim.g.molten_auto_open_output = false
  --     vim.g.molten_virt_text_output = true
  --     vim.g.molten_virt_lines_off_screen = false
  --     vim.g.molten_wrap_output = true
  --   end,
  -- },
  --
  -- {
  --   "quarto-dev/quarto-nvim",
  --   dependencies = {
  --     "jmbuhr/otter.nvim",
  --     "neovim/nvim-lspconfig",
  --     "benlubas/molten-nvim",
  --   },
  --   ft = { "quarto", "markdown" },
  --   keys = {
  --     { "<leader>rc", function() require("quarto.runner").run_cell() end, desc = "Run Cell" },
  --     { "<leader>ra", function() require("quarto.runner").run_all() end, desc = "Run All Cells" },
  --   },
  --   opts = {
  --     codeRunner = {
  --       enabled = true,
  --       default_method = "molten",
  --     },
  --   },
  -- },
  --
  -- {
  --   "jmbuhr/otter.nvim",
  --   config = true,
  -- },
  {
    "ajbucci/ipynb.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
      "nvim-tree/nvim-web-devicons",
      "folke/snacks.nvim",
    },
    opts = {},
  },

  {
    "folke/snacks.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      image = {
        enabled = true,
        force_magick = true, -- Ép dùng ImageMagick để ổn định trên Windows
        io = {
          cmd = "magick",    -- Dùng lệnh từ scoop install imagemagick
        },
        doc = {
          inline = true,     -- Hiện ảnh ngay trong file (Notebook/Markdown)
          render_all = true, -- Tự động vẽ lại ảnh khi cuộn trang
          max_width = 80,    -- Giới hạn độ rộng để không tràn màn hình
          max_height = 40,
        },
      },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      words = { enabled = true },
    },
  },
}
