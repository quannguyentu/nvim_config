return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern", -- Uses modern Neovim popup styling
    spec = {
      -- Define keymap groups and their display names
      { "<leader>f", group = "🔍 Find" },
      { "<leader>g", group = "🔀 Git" },
      { "<leader>s", group = "🔎 Search & LSP" },
      { "<leader>w", group = "🪟 Windows" },
    },
  },
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
