---@diagnostic disable: missing-fields
return {
  "neovim/nvim-lspconfig", -- still useful for the bundled default server configs
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Install and manage LSP servers via Mason
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "jsonls" },
    })

    -- Diagnostic display: virtual text with icon prefix instead of default
    vim.diagnostic.config({
      virtual_text = {
        prefix = function(diagnostic)
		local icons = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN]  = " ",
            		[vim.diagnostic.severity.INFO]  = " ",
            		[vim.diagnostic.severity.HINT]  = " ",
		}
		return icons[diagnostic.severity]
	end,
	}

})

    -- Capabilities applied to every server (equivalent of servers["*"] in the
    -- original spec): disable dynamic registration for didChangeWatchedFiles
    -- to avoid heavy file-watching overhead on large projects.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.workspace = capabilities.workspace or {}
    capabilities.workspace.didChangeWatchedFiles = {
      dynamicRegistration = false,
    }

    -- Pull in cmp_nvim_lsp capabilities if you use nvim-cmp; safe to remove
    -- if you don't have it installed.
    local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if has_cmp then
      capabilities = cmp_lsp.default_capabilities(capabilities)
    end

    -- vim.lsp.config('*', ...) merges into EVERY server's config,
    -- same role as servers["*"] previously
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- qmlls: QML language server
    -- only relevant in projects with a .qmlls.ini config file present
    vim.lsp.config("qmlls", {
      cmd = { "qmlls6" },
      root_markers = { ".qmlls.ini" },
    })

    -- jsonls: extend supported filetypes to include jsonc/json5
    vim.lsp.config("jsonls", {
      filetypes = { "json", "jsonc", "json5" },
    })

    -- lua_ls: full custom settings ported from the original spec
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          misc = {
            -- parameters = { "--loglevel=trace" },
          },
          hover = {
            expandAlias = false,
          },
          type = {
            castNumberToInteger = true,
            inferParamType = true,
          },
          diagnostics = {
            disable = {
              "incomplete-signature-doc",
              "trailing-space",
              "missing-local-export-doc",
            },
            -- enable = false,
            groupSeverity = {
              strong = "Warning",
              strict = "Warning",
            },
            groupFileStatus = {
              ["ambiguity"] = "Opened",
              ["await"] = "Opened",
              ["codestyle"] = "None",
              ["duplicate"] = "Opened",
              ["global"] = "Opened",
              ["luadoc"] = "Opened",
              ["redefined"] = "Opened",
              ["strict"] = "Opened",
              ["strong"] = "Opened",
              ["type-check"] = "Opened",
              ["unbalanced"] = "Opened",
              ["unused"] = "Opened",
            },
            unusedLocalExclude = { "_*" },
          },
        },
      },
    })

    -- Activate the servers configured above. Add more names here as you
    -- add new vim.lsp.config(...) blocks (or new Mason-installed servers
    -- that are fine with their built-in defaults).
    vim.lsp.enable({ "qmlls", "jsonls", "lua_ls" })
  end,
}
