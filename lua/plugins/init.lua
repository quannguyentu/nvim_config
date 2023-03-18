return {
  -- add you plugins here like:
  --------------nvim-cmp------------------
  'neovim/nvim-lspconfig',
  "williamboman/nvim-lsp-installer",
  "rafamadriz/friendly-snippets",
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  {'hrsh7th/nvim-cmp',
  config = function()
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  servers = {"ccls",
  "pyright",
  "gopls",
  "bashls"
  }
  for _,server in ipairs(servers) do 
    require('lspconfig')[server].setup {
    capabilities = capabilities 
    }
    end
  end
  },
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
  ----------nvim-treesitter--------------
  {'nvim-treesitter/nvim-treesitter',
  	config = function() require'nvim-treesitter'.setup {
			  -- A list of parser names, or "all" (the four listed parsers should always be installed)
			  ensure_installed = { "c", "lua", "vim", "help", "python", "go", "cpp"},

			  -- Install parsers synchronously (only applied to `ensure_installed`)
			  sync_install = false,

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
