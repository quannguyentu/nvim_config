return {
	{'nvim-mini/mini.nvim',
	version = false,
  	config = function()
    	require('mini.ai').setup()
    	require('mini.surround').setup()
    	require('mini.operators').setup()
    	require('mini.pick').setup()
    	require('mini.bracketed').setup()
    	require('mini.comment').setup()
    	require('mini.pairs').setup()
    	require('mini.icons').setup()
  	end
	}
}
