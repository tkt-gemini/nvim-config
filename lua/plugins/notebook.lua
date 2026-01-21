-- ~/.config/nvim/lua/plugins/notebook.lua

return {
    {
        "3rd/image.nvim",
        build = false,
        opts = {
            backend = "sixel",
            processor = "magick_cli",
            max_width = 100,
            max_height = 12,
            max_width_window_percentage = math.huge,
            max_height_window_percentage = math.huge,
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = true,
                    only_render_image_at_cursor = false,
                    filetypes = { "markdown", "vimwiki", "quarto" },
                },
            },
        },
    },

    {
        "benlubas/molten-nvim",
        version = "*",
        build = ":UpdateRemotePlugins",
        dependencies = { "3rd/image.nvim" },
        init = function()
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_auto_open_output = false
            vim.g.molten_wrap_output = true
            vim.g.molten_virt_text_output = true
            vim.g.molten_virt_lines_off_by_1 = true
        end,
    },

    {
        "quarto-dev/quarto-nvim",
        dependencies = {
            "jmbuhr/otter.nvim",
            "neovim/nvim-lspconfig",
        },
        ft = { "quarto", "markdown" },
        config = function()
            require("quarto").setup({
                lspFeatures = {
                    languages = { "python", "lua", "bash" },
                    chunks = "all",
                    diagnostics = {
                        enabled = true,
                        triggers = { "BufWritePost" },
                    },
                    completion = {
                        enabled = true,
                    },
                },
                codeRunner = {
                    enabled = true,
                    default_method = "molten",
                },
                keymap = {
                    hover = "K",
                    definition = "gd",
                    run_cell = "<leader>rc",  -- Run Cell
                    run_above = "<leader>ra", -- Run Above
                    run_all = "<leader>raa",  -- Run All
                },
            })
            
            local runner = require("quarto.runner")
            vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "Run Cell", silent = true })
            vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "Run Cell Above", silent = true })
            vim.keymap.set("n", "<leader>rA", runner.run_all, { desc = "Run All Cells", silent = true })
        end,
    },

    {
        "jmbuhr/otter.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        opts = {},
    },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        ft = { "markdown", "quarto" },
        opts = {
            file_types = { "markdown", "quarto" },
            code = {
                sign = false,
                width = "block",
                right_pad = 1,
            },
            heading = {
                sign = false,
                icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
            },
        },
    },
}
