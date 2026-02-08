-- lua/plugins/treesitter.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      local languages = { "python", "markdown", "markdown_inline", "lua", "vim", "bash", "c", "cpp" }
      local installed = ts.get_installed()
      local installing = {}

      for _, lang in ipairs(languages) do
        if not table.contains(installed, lang) then
          table.insert(installing, lang)
        end
      end

      if #installing > 0 then
        ts.install(installing)
      end

      vim.treesitter.language.register("markdown", "quarto")
    end,
  }
}
