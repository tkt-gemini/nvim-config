-- ~/.config/nvim/lua/plugins/ui.lua

return {
	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = "•",
				section_separators = { left = "", right = "" },
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
				lualine_z = {},
			},
			extensions = { "nvim-tree", "toggleterm" },
		},
		config = function(_, opts)
			local function locationSection()
				local line = vim.fn.line(".")
				local col = vim.fn.col(".")
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

			require("lualine").setup(opts)
		end,
	},

	-- Bufferline
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		opts = {
			options = {
				mode = "buffers",
				indicator = {
					icon = '',
				},
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = true
					}
				},
			},
      highlights = {
        buffer_selected = {
          bold = false,
          italic = false,
        },
      },
		},
		config = function(_, opts)
			require('bufferline').setup(opts)
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
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
				"go",
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.config").setup(opts)
		end,
	},

	-- Integrated terminal
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = {
			open_mapping = [[<C-\>]],
			direction = 'float',
		},
		config = function(_, opts)
			require('toggleterm').setup(opts)
		end,
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
					treesitter = false,
				},
				file_ignore_patterns = {
					"node_modules",
					"%.lock",
					"%.git/",
					"%.pixi/",
					"build/",
					"dist/",
					"vendor/",
				},
			},
		},
		config = function(_, opts)
			local telescope = require('telescope')

			telescope.setup(opts)
			telescope.load_extension('fzf')
		end,
	},

	-- Sidebar
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
		},
		config = function(_, opts)
			require("nvim-tree").setup(opts)
		end,
	},
}
