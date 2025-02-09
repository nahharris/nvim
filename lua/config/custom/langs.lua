local nls = require "null-ls"
local lspconfig = require "lspconfig"

nls.register {
    nls.builtins.formatting.alejandra,
}

lspconfig.nixd.setup {
    cmd = { "nixd" },
    filetypes = { "nix" },
    settings = {
        nixd = {
            nixpkgs = {
                expr = "import <nixpkgs> {}",
            },
            options = {
                home_manager = {
                    expr = "(builtins.getFlake \"/home/ojarrisonn_/.config/home-manager\").homeConfigurations.\"ojarrisonn_\".options",
                },
            },
        },
    },
}
