-- lua/plugins/telescope.lua
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    lazy = false,
    priority = 1000,
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = vim.fn.has("win32") == 1
                    and "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
                or "make",
        },
    },
    opts = {
        defaults = {
            path_display = { "truncate" },
        },
    },
    keys = {
        -- The <leader><leader> shortcut (Space + Space)
        { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },

        -- Standard LazyVim file and search shortcuts
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
        { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep (Root Dir)" },
        { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
}
