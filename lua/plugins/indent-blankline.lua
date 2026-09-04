return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    -- Indent line appearance
    indent = {
      char = "▏", -- Thin vertical bar (alternatives: "▎", "│", "┆", "┊")
      tab_char = "▏", -- Same for tabs
      highlight = "IblIndent", -- Custom highlight group (define below)
      smart_indent_cap = true, -- Don't show more than actual indent
      priority = 2, -- Render priority
    },

    -- Scope (current block) highlighting
    scope = {
      enabled = true, -- Enable scope highlighting
      char = "▏", -- Same char for scope
      highlight = "IblScope", -- Custom highlight for current scope
      priority = 1024, -- High priority to stay on top
      include = { -- Node types to consider as scope
        node_type = {
          lua = { "chunk", "do_statement", "while_statement", "repeat_statement", "if_statement", "for_statement", "function_declaration" },
          python = { "function_definition", "class_definition", "if_statement", "for_statement", "while_statement", "with_statement" },
          javascript = { "function_declaration", "function_expression", "arrow_function", "if_statement", "for_statement", "while_statement", "switch_statement" },
          typescript = { "function_declaration", "function_expression", "arrow_function", "if_statement", "for_statement", "while_statement", "switch_statement" },
          rust = { "function_item", "struct_item", "enum_item", "impl_item", "mod_item", "if_expression", "for_expression", "while_expression", "loop_expression" },
          go = { "function_declaration", "method_declaration", "if_statement", "for_statement", "switch_statement", "select_statement" },
        },
      },
      exclude = { language = {} },
      injected_languages = true, -- Work with injected languages (e.g., JS in HTML)
    },

    -- Exclude certain filetypes/buftypes entirely
    exclude = {
      filetypes = {
        "help", "terminal", "dashboard", "lazy", "mason", "notify", "toggleterm",
        "noice", "which_key", "TelescopePrompt", "Trouble", "lspinfo", "checkhealth",
        "man", "gitcommit", "gitrebase", "markdown", "text", "alpha", "neo-tree", "oil",
      },
      buftypes = { "terminal", "nofile", "quickfix", "prompt" },
    },

    -- Whitespace handling
    whitespace = {
      highlight = "IblWhitespace",
      remove_blankline_trail = true, -- Don't show indent on blank lines
    },
  },

}
