return {
  "tpope/vim-fugitive",
  cmd = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>",         desc = "Git Status" },
    { "<leader>gj", "<cmd>diffget //2<cr>", desc = "Merge Conflict: Keep Left (Target)" },
    { "<leader>gk", "<cmd>diffget //3<cr>", desc = "Merge Conflict: Keep Right (Merge)" },
    { "<leader>gb", "<cmd>Git blame<cr>",   desc = "Git Blame" },
  }
}
