return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "css",
                "editorconfig",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsv",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
        },
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
                "flake8",
                "pylint",
                "mypy",
                "rust-analyzer",
            },
        },
    },
}
