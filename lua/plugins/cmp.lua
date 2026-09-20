return {
    {
        "hrsh7th/nvim-cmp",
        version = false, -- Last release is too old
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "onsails/lspkind.nvim", -- Adds VS Code style icons to completion menu
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")

            cmp.setup({
                -- Configure the snippet engine
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                -- Add borders to the completion and documentation windows
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                -- Format the menu with icons
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        ellipsis_char = "...",
                    }),
                },

                -- Keybindings for the menu
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                }),

                -- Sources to pull autocomplete data from
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),

                -- Inline ghost text preview
                experimental = {
                    ghost_text = {
                        hl_group = "CmpGhostText",
                    },
                },
            })

            -- Setup ghost text highlight color
            vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
        end,
    },
}
