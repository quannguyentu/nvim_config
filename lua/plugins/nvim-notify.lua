return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    -- Animation style (see :h nvim-notify.config.stages)
    stages = "fade_in_slide_out",
    -- Default timeout for notifications (ms)
    timeout = 3000,
    -- Maximum width of notification window
    max_width = 60,
    -- Maximum height of notification window
    max_height = 10,
    -- Background color (uses your colorscheme's Normal bg by default)
    background_colour = "#000000",
    -- Minimum width
    minimum_width = 10,
    -- Icons for each level
    icons = {
      ERROR = "",
      WARN  = "",
      INFO  = "",
      DEBUG = "",
      TRACE = "✎",
    },
    -- Render style: "default", "minimal", "simple", "compact", "wrapped-compact"
    render = "default",
    -- Position: "top_right", "top_left", "bottom_right", "bottom_left", "top_center", "bottom_center"
    top_down = true,
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    vim.notify = notify

    -- Optional: telescope integration for notification history
    -- require("telescope").load_extension("notify")
  end,
  keys = {
    { "<leader>un", function() require("notify").dismiss({ silent = true, pending = true }) end, desc = "Dismiss all notifications" },
    { "<leader>uh", function() require("telescope").extensions.notify.notify() end, desc = "Notification history (telescope)" },
  },
}