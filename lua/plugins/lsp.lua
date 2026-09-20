-- lua/plugins/lsp.lua
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("mason").setup()

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Modern syntax: pass handlers directly into setup
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "pyright" },
                handlers = {
                    function(server_name)
                        if server_name ~= "jdtls" then
                            lspconfig[server_name].setup({
                                capabilities = capabilities,
                            })
                        end
                    end,
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
                    end
                    map("gd", vim.lsp.buf.definition, "Go to Definition")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                end,
            })
        end,
    },
}
