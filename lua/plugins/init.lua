return {
  -- add you plugins here like:
   ------------hop.nvim----------------
  {
  'phaazon/hop.nvim',
    -- you can configure Hop the way you like here; see :h hop-config
    config = function()
	    require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },

  -----------nvim.comment----------------
  {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  },
  ------------- lualine.nvim -------------
  {
  'nvim-lualine/lualine.nvim',
  dependencies = {},
  config = function()
    require('lualine').setup {
	    options = { theme = 'auto' },
	    extenstions = { 'neo-tree' }
    }
  end
  },

  --------------neo-tree.nvim----------------
  {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    }
  },

  --------------neoscroll.nvim------------
  {
      "karb94/neoscroll.nvim",
      event = "VimEnter",
      config = function()
	require("neoscroll").setup()
      end
    },

  --------------neoformat-----------------
  {'sbdchd/neoformat'},

  --------------wilder.nvim----------------
  {"gelguy/wilder.nvim", lazy = true},
  
  ----------------autopairs----------------
  {	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },
  ----------copilot-------------------
  {"github/copilot.vim"},

  ----------kanagawa.nvim----------------
  {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function() 
	  vim.cmd([[colorscheme kanagawa]])
  end
  },

  -----------feline.nvim------------
  'feline-nvim/feline.nvim',
}
