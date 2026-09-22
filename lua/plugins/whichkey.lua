-- lua/plugins/whichkey.lua
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix", -- Gives you the modern which-key v3 UI
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)

        -- Register your custom groups AND restore the standard LazyVim groups
        wk.add({
            { "<leader>c", group = "code" },
            { "<leader>f", group = "file/find" },
            { "<leader>g", group = "git" },
            { "<leader>h", group = "Fun & History", icon = "" },
            { "<leader>i", group = "refactor", icon = "" },
            { "<leader>j", group = "find and search", icon = "" },
            { "<leader>s", group = "search" },
            { "<leader>t", group = "test" },
            { "<leader>x", group = "diagnostics/quickfix" },
            { "[", group = "prev" },
            { "]", group = "next" },
            { "g", group = "goto" },
        })
    end,
}
