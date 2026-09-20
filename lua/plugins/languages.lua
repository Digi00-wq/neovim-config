-- lua/plugins/languages.lua
return {
  -- Clangd extensions for C and C++
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp" },
    opts = {
      inlay_hints = { inline = false },
    },
  },

  -- JSON and YAML schemas
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false,
  },

  -- Render Markdown in buffers
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- Python virtual environment selector
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    ft = "python",
    opts = {},
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select Python VirtualEnv" },
    },
  },

  -- Test runner core
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Run Nearest Test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File Tests" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Test Summary" },
    },
  },
}
