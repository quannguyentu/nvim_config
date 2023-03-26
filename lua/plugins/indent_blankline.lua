return{ 
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("indent_blankline").setup {
			buftype_exclude = { "terminal" },
			show_trailing_blankline_indent = false,
			show_first_indent_level = false,
			show_current_context = true,
			context_patterns = {
				"class",
				"function",
				"method",
				"^if",
				"^while",
				"jsx_element",
				"^for",
				"^object",
				"^table",
				"block",
				"arguments",
				"if_statement",
				"else_clause",
				"jsx_element",
				"jsx_self_closing_element",
				"try_statement",
				"catch_clause",
				"import_statement",
				"operation_type",
			},
		}
	end,
}
