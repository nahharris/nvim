return {
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
}
