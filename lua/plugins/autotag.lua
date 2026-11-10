return {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        opts = {
            -- Defaults
            enable_close = true,
            enable_rename = true,
            enable_close_on_slash = true,
        },
    },
}
