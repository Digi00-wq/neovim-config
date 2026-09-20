return {
    -- 1. JDTLS Konfiguration
    {
        "mfussenegger/nvim-jdtls",
        opts = function(_, opts)
            local config_dir = vim.fn.stdpath("config")
            local win_safe_path = config_dir:gsub("\\", "/")
            local format_url = "file:///" .. win_safe_path .. "/eclipse-style.xml"

            local lombok_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"

            opts.settings = opts.settings or {}
            opts.settings.java = opts.settings.java or {}

            opts.settings.java.format = {
                settings = { url = format_url },
            }

            opts.jdtls_args = {
                "-Xmx2G",
                "-XX:+UseParallelGC",
                "-Xms512m",
                "-javaagent:" .. lombok_path,
            }

            return opts
        end,
        config = function() end,
    },

    -- 2. Java File Creator
    {
        "nirmalravidas/nvim-javacreator",
        opts = {},
        keys = {
            { "<leader>jn", "<cmd>lua require('javacreator').create_java_file()<CR>", desc = "Java File Creator" },
        },
    },

    -- 3. Spring Boot Tools (Nur EINMAL und absturzsicher)
    {
        "elmcgill/springboot-nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-jdtls",
        },
        ft = "java",
        config = function()
            -- pcall (protected call) fängt den Fehler ab, falls das Plugin
            -- die Projektstruktur (package_location) nicht finden kann.
            pcall(function()
                require("springboot-nvim").setup({})
            end)
        end,
        keys = {
            {
                "<leader>jr",
                function()
                    require("springboot-nvim").boot_run()
                end,
                desc = "Spring Boot Run Project",
            },
            {
                "<leader>jc",
                function()
                    require("springboot-nvim").generate_class()
                end,
                desc = "Java Create Class",
            },
        },
    },
}
