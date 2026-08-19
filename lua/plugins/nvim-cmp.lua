return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- Adds LSP completion capabilities
    "hrsh7th/cmp-nvim-lsp",

    -- Adds other sources (buffer, path)
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",

    -- Adds a ton of default snippets for various languages
    "rafamadriz/friendly-snippets",

    -- Adds Nerd Font icons to the completion menu
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Load friendly-snippets (VSCode style snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Helper function to check if there are words before the cursor
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup({
      -- Configure snippet engine
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- Configure completion menu appearance (Nerd Fonts)
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text", -- Show both icon and text
          maxwidth = 50,        -- Prevent the menu from getting too wide
          ellipsis_char = "...",-- Show ellipsis for truncated text
          -- Optional: Override specific symbol kinds if you want custom icons
          -- symbol_map = { 
          --   Text = "󰉿",
          --   Method = "󰆧",
          --   Function = "󰊕",
          --   Constructor = "",
          --   Field = "󰜢",
          --   Variable = "󰀫",
          --   Class = "󰠱",
          --   Interface = "",
          --   Module = "",
          --   Property = "󰜢",
          --   Unit = "󰑭",
          --   Value = "󰎠",
          --   Enum = "",
          --   Keyword = "󰌋",
          --   Snippet = "",
          --   Color = "󰏘",
          --   File = "󰈙",
          --   Reference = "󰈇",
          --   Folder = "󰉋",
          --   EnumMember = "",
          --   Constant = "󰏿",
          --   Struct = "󰙅",
          --   Event = "",
          --   Operator = "󰆕",
          --   TypeParameter = "",
          -- },
        }),
      },

      -- Keybindings for the completion menu
      mapping = cmp.mapping.preset.insert({
        -- Scroll up/down in the documentation window
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        
        -- Trigger completion manually
        ["<C-Space>"] = cmp.mapping.complete(),
        
        -- Abort completion
        ["<C-e>"] = cmp.mapping.abort(),
        
        -- Accept completion. <C-y> is default, <CR> is also very common.
        -- Using <CR> will only confirm if a completion is selected, otherwise it acts as normal Enter.
        ["<CR>"] = cmp.mapping.confirm({ select = true }), 

        -- Tab / Shift-Tab for navigating the menu or jumping through snippets
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      -- Define the sources for completion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- LSP completions
        { name = "luasnip" },   -- Snippet completions
        { name = "buffer" },    -- Text inside current buffer
        { name = "path" },      -- File paths
      }),
    })

    -- Use buffer & path sources for command-line mode
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" }
      }
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" }
      }, {
        { name = "cmdline" } -- Requires hrsh7th/cmp-cmdline if you want command completions
      })
    })
  end,
}
