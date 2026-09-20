-- lua/plugins/editor-tools.lua
return {
  -- Yanky: clipboard history and navigation
  {
    "gbprod/yanky.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ring = { history_length = 100 },
      highlight = { timer = 200 },
    },
    keys = {
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put after" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put before" },
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
    },
  },

  -- Dial: enhanced increment/decrement (<C-a> and <C-x>)
  {
    "monaqa/dial.nvim",
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
  },

  -- Inc-rename: real-time LSP symbol renaming
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
    keys = {
      {
        "<leader>cr",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Incremental Rename",
      },
    },
  },

  -- Mini.hipatterns: highlight hex colors, rgb, and custom patterns
  {
    "echasnovski/mini.hipatterns",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },

-- Startup profiler (:StartupTime)
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },}
