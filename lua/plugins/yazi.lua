return {
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
}
