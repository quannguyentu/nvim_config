local active_theme = "everforest" --WIP

local use_theme = function(name)
	local fine, err = pcall(vim.cmd.colorscheme, name)
	if not fine then
		vim.notify(string.format("Failed to load colorscheme %s, err: %s", name, err),
			vim.log.levels.WARN)
	end
end

return {
	--tokyonight--
	{"folke/tokyonight.nvim",lazy = false, priority = 1000},
	{"sainnhe/everforest", lazy = false, priority = 1000,
	config = function ()
		use_theme("everforest")
	end},

}
