-- lua/plugins/treesitter.lua
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- Forces Lazy to use the stable branch with configs.lua
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "c",
            "cpp",
            "java",
            "lua",
            "python",
            "javascript",
            "typescript",
            "markdown",
            "markdown_inline",
            "bash",
            "vim",
            "vimdoc",
        },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
