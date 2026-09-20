return {
    -- Auto-close parenthesis, brackets, and quotes
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {
            modes = { insert = true, command = true, terminal = false },
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            skip_ts = { "string" },
            skip_unbalanced = true,
            markdown = true,
        },
    },

    -- Add, delete, or replace surrounding quotes/brackets (gsa, gsd, gsr)
    {
        "echasnovski/mini.surround",
        event = "VeryLazy",
        opts = {
            mappings = {
                add = "gsa", -- Add surrounding (e.g., gsaiw")
                delete = "gsd", -- Delete surrounding (e.g., gsd")
                replace = "gsr", -- Replace surrounding (e.g., gsr"')
                find = "gsf", -- Find surrounding to the right
                find_left = "gsF", -- Find surrounding to the left
                highlight = "gsh", -- Highlight surrounding
                update_n_lines = "gsn", -- Update `n_lines`
            },
        },
    },

    -- Extended text objects (select inside function, class, etc.)
    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        opts = function()
            local ai = require("mini.ai")
            return {
                n_lines = 500,
                custom_textobjects = {
                    o = ai.gen_spec.treesitter({
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                    }),
                    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
                    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
                },
            }
        end,
    },

    -- Fast icon provider (replaces nvim-web-devicons)
    {
        "echasnovski/mini.icons",
        lazy = true,
        opts = {},
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        opts = function()
            local ai = require("mini.ai")
            return {
                n_lines = 500,
                custom_textobjects = {
                    o = ai.gen_spec.treesitter({
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                    }),
                    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
                    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
                    -- Add the 'g' text object for the entire buffer
                    g = function()
                        local from = { line = 1, col = 1 }
                        local to = {
                            line = vim.fn.line("$"),
                            col = math.max(vim.fn.getline("$"):len(), 1),
                        }
                        return { from = from, to = to }
                    end,
                },
            }
        end,
    },
}
