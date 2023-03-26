 ----------nvim-treesitter--------------
return {
	'nvim-treesitter/nvim-treesitter',
	config = function() require'nvim-treesitter'.setup {
		-- A list of parser names, or "all" (the four listed parsers should always be installed)
		ensure_installed = { "c", "lua", "vim", "help", "python", "go", "cpp", "prolog"},

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = true,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,

		-- List of parsers to ignore installing (for "all")
		ignore_install = { "javascript" },

		---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
		-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
		--
		indent = {
			enable = true
		}
	} 
	end 
}

