-- lua/plugins/dressing.lua
return {
    "stevearc/dressing.nvim",
    lazy = false, -- WICHTIG: Überschreibt die Menüs sofort beim Start
    opts = {
        input = { enabled = true },
        select = {
            enabled = true,
            backend = { "telescope", "fzf_lua", "fzf", "builtin" },
        },
    },
}
