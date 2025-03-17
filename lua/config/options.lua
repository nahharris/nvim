-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.env.PATH = "C:\\Users\\jorge\\scoop\\apps\\mise\\current\\mise\\shims;" .. vim.env.PATH
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.g.autoformat = true

vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"

vim.g.lazyvim_eslint_auto_format = true
