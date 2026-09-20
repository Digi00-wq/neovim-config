return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
      lua = { "stylua" },
      go = { "gofmt" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      markdown = { "prettier" },
      yaml = { "prettier" },
      elixir = { "mix" },
      bash = { "shfmt" },
      java = { "lsp" },
    },
    format_on_save = {
      timeout_ms = 3000,
      lsp_format = "fallback",
    },
    formatters = {
      ["clang-format"] = {
        prepend_args = { "-style=file", "-fallback-style=LLVM" },
      },
    },
  },
  keys = {
    {
      "<leader>jf",
      function()
        require("conform").format({ bufnr = 0, async = true })
      end,
      desc = "Format buffer",
    },
  },
}
