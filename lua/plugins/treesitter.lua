-- lua/plugins/treesitter.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      -- ts.install({ "python", "markdown", "markdown_inline", "lua", "vim", "bash", "c", "cpp" })
      vim.treesitter.language.register("markdown", "quarto")
    end,
  }
}
