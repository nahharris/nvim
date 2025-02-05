return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        table.insert(opts.sections.lualine_c, { "navic", color_correction = "dynamic" })
    end,
    config = function()
        local colors = {
            base00 = "#1e1e2e",
            base01 = "#181825",
            base02 = "#313244",
            base03 = "#45475a",
            base04 = "#585b70",
            base05 = "#cdd6f4",
            base06 = "#f5e0dc",
            base07 = "#b4befe",
            base08 = "#f38ba8",
            base09 = "#fab387",
            base0A = "#f9e2af",
            base0B = "#a6e3a1",
            base0C = "#94e2d5",
            base0D = "#89b4fa",
            base0E = "#cba6f7",
            base0F = "#f2cdcd",
        }
        local icons = LazyVim.config.icons
        local lltheme = {
            normal = {
                a = { bg = colors.base0E, fg = colors.base01, gui = "bold" },
                b = { bg = colors.base09, fg = colors.base01 },
                c = { bg = colors.base00, fg = colors.base05 },
            },
            insert = {
                a = { bg = colors.base09, fg = colors.base01, gui = "bold" },
                b = { bg = colors.base0B, fg = colors.base01 },
                c = { bg = colors.base00, fg = colors.base05 },
            },
            visual = {
                a = { bg = colors.base0B, fg = colors.base01, gui = "bold" },
                b = { bg = colors.base0C, fg = colors.base01 },
                c = { bg = colors.base00, fg = colors.base05 },
            },
            replace = {
                a = { bg = colors.base0C, fg = colors.base01, gui = "bold" },
                b = { bg = colors.base07, fg = colors.base01 },
                c = { bg = colors.base00, fg = colors.base05 },
            },
            command = {
                a = { bg = colors.base07, fg = colors.base01, gui = "bold" },
                b = { bg = colors.base06, fg = colors.base01 },
                c = { bg = colors.base00, fg = colors.base05 },
            },
            inactive = {
                a = { bg = colors.base01, fg = colors.base01, gui = "bold" },
                b = { bg = colors.base01, fg = colors.base01 },
                c = { bg = colors.base01, fg = colors.base05 },
            },
        }

        require("lualine").setup {
            options = {
                theme = lltheme,
                section_separators = { left = "", right = "" },
                -- component_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },

                lualine_c = {
                    LazyVim.lualine.root_dir(),
                    {
                        "diagnostics",
                        symbols = {
                            error = icons.diagnostics.Error,
                            warn = icons.diagnostics.Warn,
                            info = icons.diagnostics.Info,
                            hint = icons.diagnostics.Hint,
                        },
                    },
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    {
                        LazyVim.lualine.pretty_path(),
                    },
                },
                lualine_x = {
                    Snacks.profiler.status(),
                    {
                        function()
                            ---@diagnostic disable-next-line: undefined-field
                            return require("noice").api.status.command.get()
                        end,
                        cond = function()
                            ---@diagnostic disable-next-line: undefined-field
                            return package.loaded["noice"] and require("noice").api.status.command.has()
                        end,
                        color = function()
                            return { fg = Snacks.util.color "Statement" }
                        end,
                    },
                    {
                        function()
                            ---@diagnostic disable-next-line: undefined-field
                            return require("noice").api.status.mode.get()
                        end,
                        cond = function()
                            ---@diagnostic disable-next-line: undefined-field
                            return package.loaded["noice"] and require("noice").api.status.mode.has()
                        end,
                        color = function()
                            return { fg = Snacks.util.color "Constant" }
                        end,
                    },
                    {
                        function()
                            return "  " .. require("dap").status()
                        end,
                        cond = function()
                            return package.loaded["dap"] and require("dap").status() ~= ""
                        end,
                        color = function()
                            return { fg = Snacks.util.color "Debug" }
                        end,
                    },
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                        color = function()
                            return { fg = Snacks.util.color "Special" }
                        end,
                    },
                    {
                        "diff",
                        symbols = {
                            added = icons.git.added,
                            modified = icons.git.modified,
                            removed = icons.git.removed,
                        },
                        source = function()
                            local gitsigns = vim.b.gitsigns_status_dict
                            if gitsigns then
                                return {
                                    added = gitsigns.added,
                                    modified = gitsigns.changed,
                                    removed = gitsigns.removed,
                                }
                            end
                        end,
                    },
                },
                lualine_y = {
                    { "location", padding = { left = 1, right = 1 } },
                },
                lualine_z = {
                    function()
                        return " " .. os.date "%R"
                    end,
                    function()
                        return require("battery").get_status_line()
                    end,
                },
            },
        }
    end,
}
