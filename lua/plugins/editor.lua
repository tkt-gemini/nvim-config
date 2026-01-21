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
		"3rd/image.nvim",
		build = false,
		opts = {
			backend = "sixel",
			processor = "magick_cli",
		},
	},

	{
		"benlubas/molten-nvim",
		version = "*",
		dependencies = { "3rd/image.nvim" },
		build = ":UpdateRemotePlugins",
		ft = { "python", "julia", "r", "markdown" },
		init = function()
			vim.g.molten_cell_delimiter = "^# %%%%?"
			vim.g.molten_auto_open_output = true
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
		end,
	},
}
