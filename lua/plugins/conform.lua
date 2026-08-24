return {
	"stevearc/conform.nvim",
	event = { 'BufWritePre' },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format(
					{
						async = true,
						lsp_fallback = true
					}
				)
			end,
			mode = { "n", "v" },
			desc = "Conform.nvim Format buffer",
		}
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format", "ruff_organize_imports" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			sh = { "shfmt" },
			rust = { "rustfmt" },
		},
		format_on_save = { timeout_ms = 500, lsp_fallback = true }
	},
}
