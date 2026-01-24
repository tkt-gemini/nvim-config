-- ~/.config/nvim/lua/plugins/editor.lua

return {
	-- Auto-close pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Comment with `gcc` (line) or `gc` (motion)
	{
		"numToStr/Comment.nvim",
    config = true,
	},

	-- Git signs in sign column
	{
		"lewis6991/gitsigns.nvim",
    config = true,
	},

	-- Indentation
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = true },
		},
	},

  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      bind = true,
      floating_window = false,
      hint_enable = true,
      hint_prefix = "🙀 ",
      toggle_key = '<C-k>',
    },
    config = function(_, opts)
      require('lsp_signature').setup(opts)
    end,
  },
}
