return {
  -- DAP (Debug Adapter Protocol) client for Neovim
  -- Decouples the IDE from language-specific debug engines via adapters
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    -- Inline variable values in the editor gutter while debugging
    "theHamsta/nvim-dap-virtual-text",

    -- Interactive debug panel: watches, breakpoints, scopes, REPL
    "rcarriga/nvim-dap-ui",

    -- Syntax highlighting for the DAP REPL buffer
    {
      "LiadOz/nvim-dap-repl-highlights",
      config = true,
      dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-treesitter/nvim-treesitter",
      },
      build = function()
        if not require("nvim-treesitter.parsers").has_parser("dap_repl") then
          vim.cmd(":TSInstall dap_repl")
        end
      end,
    },
  },
  config = function()
    -- Guarded requires: won't error if a dependency is missing
    local present_dapui, dapui = pcall(require, "dapui")
    local present_dap, dap = pcall(require, "dap")
    local present_virtual_text, dap_vt = pcall(require, "nvim-dap-virtual-text")
    local present_dap_utils, dap_utils = pcall(require, "dap.utils")

    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Virtual text: show variable values inline next to code
    if present_virtual_text then
      dap_vt.setup({
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        show_stop_reason = true,
        virt_text_pos = "eol",
      })
    end

    -- DAP UI panel layout and keybindings
    if present_dapui then
      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸" },
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        expand_lines = vim.fn.has("nvim-0.7"),
        layouts = {
          {
            elements = {
              { id = "watches",     size = 0.25 },
              { id = "breakpoints", size = 0.25 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = { "scopes", "repl" },
            size = 0.25,
            position = "bottom",
          },
        },
        floating = {
          max_height = nil,
          max_width = nil,
          border = "rounded",
          mappings = { close = { "q", "<Esc>" } },
        },
        windows = { indent = 1 },
      })
    end

    -- Set log verbosity for DAP communication
    dap.set_log_level("TRACE")

    -- Wire DAP lifecycle events to the UI (open on start, close on exit)
    if present_dapui then
      dap.listeners.before.attach["dapui_config"] = function() dapui.open() end
      dap.listeners.before.launch["dapui_config"] = function() dapui.open() end
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end

    -- Enable virtual text globally
    if present_virtual_text then
      vim.g.dap_virtual_text = true
    end

    -- Custom breakpoint/stop indicator icons in the sign column
    vim.fn.sign_define("DapBreakpoint", { text = "🔵" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "🔴" })
    vim.fn.sign_define("DapConditionalBreakpoint", { text = "🟡" })
    vim.fn.sign_define("DapStopped", { text = "🟢" })

    -- ── Adapters ──────────────────────────────────────────
    -- An adapter bridges nvim-dap (client) to a language runtime (engine).
    -- "executable" type spawns a subprocess that provides the DAP protocol.

    -- PowerShell adapter: spawns pwsh with PowerShell Editor Services on port 5678
    -- Prereqs: pwsh in $PATH + PowerShellEditorServices module installed
    local filetypes = { "powershell" }
    dap.adapters.powershell = {
      type = "executable",
      command = "pwsh",
      args = {
        "-NoLogo",
        "-NoProfile",
        "-Command",
        [[
          Import-Module PowerShellEditorServices;
          Start-PSDAPServer -Host 127.0.0.1 -Port 5678
        ]],
      },
      cwd = vim.fn.getcwd(),
    }

    -- ── Debug Configurations ──────────────────────────────
    -- Each config maps an adapter to a script to debug.
    -- "type" must match the adapter name registered above.
    -- "${file}" resolves to the current buffer's path.
    dap.configurations[filetypes[1]] = {
      {
        name = "Launch PowerShell",
        type = "powershell",
        request = "launch",
        program = "${file}",
      },
    }
  end,
  keys = {
    -- Debug control: continue, step, toggle breakpoint, terminate
    { "<Leader>da", "<CMD>lua require('dap').continue()<CR>",                                             desc = "Continue" },
    { "<Leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>",                                    desc = "Toggle Breakpoint" },
    { "<Leader>dB", "<CMD>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = "Conditional Breakpoint" },
    { "<Leader>di", "<CMD>lua require('dap').step_into()<CR>",                                            desc = "Step Into" },
    { "<Leader>do", "<CMD>lua require('dap').step_out()<CR>",                                             desc = "Step Out" },
    { "<Leader>dO", "<CMD>lua require('dap').step_over()<CR>",                                            desc = "Step Over" },
    { "<Leader>dt", "<CMD>lua require('dap').terminate()<CR>",                                            desc = "Terminate" },
    { "<Leader>dr", "<CMD>lua require('dap').run_to_cursor()<CR>",                                        desc = "Run to Cursor" },

    -- DAP UI: open/close panels (watches, scopes, REPL, eval)
    { "<Leader>du", "<CMD>lua require('dapui').open()<CR>",                                               desc = "Open DAP UI" },
    { "<Leader>dc", "<CMD>lua require('dapui').close()<CR>",                                              desc = "Close DAP UI" },
    { "<Leader>dw", "<CMD>lua require('dapui').float_element('watches')<CR>",                             desc = "Watches" },
    { "<Leader>ds", "<CMD>lua require('dapui').float_element('scopes')<CR>",                              desc = "Scopes" },
    { "<Leader>dr", "<CMD>lua require('dapui').float_element('repl')<CR>",                                desc = "REPL" },
    { "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>",                                               desc = "Evaluate" },
  },
}
