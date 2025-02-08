return {
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        keys = {
            -- 👇 in this section, choose your own keymappings!
            {
                "<leader>fY",
                "<cmd>Yazi<cr>",
                desc = "Open yazi (cwd)",
            },
            {
                -- Open in the current working directory
                "<leader>fy",
                "<cmd>Yazi cwd<cr>",
                desc = "Open yazi (Root)",
            },
            {
                "<leader>Y",
                "<cmd>Yazi<cr>",
                desc = "Open yazi (cwd)",
            },
            {
                -- Open in the current working directory
                "<leader>y",
                "<cmd>Yazi cwd<cr>",
                desc = "Open yazi (Root)",
            },
            {
                -- NOTE: this requires a version of yazi that includes
                -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
                "<c-up>",
                "<cmd>Yazi toggle<cr>",
                desc = "Resume the last yazi session",
            },
        },
        ---@type YaziConfig
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = false,
            keymaps = {
                show_help = "<f1>",
            },
        },
    },
    {
        "justinhj/battery.nvim",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/plenary.nvim",
        },

        config = function()
            require("battery").setup {
                update_rate = 30,
                show_status_when_no_battery = false,
                show_plugged_icon = true,
                show_unplugged_icon = false,
                show_percent = true,
                vertical_icons = true,
            }
        end,
    },
    {
        "OXY2DEV/helpview.nvim",
        lazy = false, -- Recommended

        -- In case you still want to lazy load
        ft = "help",

        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "chenasraf/text-transform.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",

            config = function()
                require("text-transform").setup {
                    keymap = {
                        telescope_popup = nil,
                    },
                }

                vim.keymap.set(
                    { "n", "v" },
                    "<leader>Ccc",
                    ":TtCamel",
                    { noremap = true, silent = true, desc = "To camelCase" }
                )
                vim.keymap.set(
                    { "n", "v" },
                    "<leader>Csn",
                    ":TtSnake",
                    { noremap = true, silent = true, desc = "To snake_case" }
                )
                vim.keymap.set(
                    { "n", "v" },
                    "<leader>Cpa",
                    ":TtPascal",
                    { noremap = true, silent = true, desc = "To PascalCase" }
                )
                vim.keymap.set(
                    { "n", "v" },
                    "<leader>Cco",
                    ":TtConst",
                    { noremap = true, silent = true, desc = "To CONST_CASE" }
                )
                vim.keymap.set(
                    { "n", "v" },
                    "<leader>Cdo",
                    ":TtDot",
                    { noremap = true, silent = true, desc = "To dot.case" }
                )
                vim.keymap.set(
                    { "n", "v" },
                    "<leader>Cke",
                    ":TtKebab",
                    { noremap = true, silent = true, desc = "To kebab-case" }
                )
                vim.keymap.set(
                    { "n", "v" },
                    "<leader>Ctt",
                    ":TtTitle",
                    { noremap = true, silent = true, desc = "To Title Case" }
                )
            end,
        },
    },
}
