return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
  },
  opts = {
    default_file_explorer = true, -- Completely replaces the built-in netrw
    columns = { "icon" },
    view_options = {
      show_hidden = true, -- Show dotfiles by default
    },
    float = {
      padding = 2,
      max_width = 90,
      max_height = 25,
    },
    win_options = {
      wrap = true,
    },
  },
}
