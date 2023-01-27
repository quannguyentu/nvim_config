local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end
--- startup and add configure plugins
return require('packer').startup(function(use)
  local use = use
  -- add you plugins here like:
  --------------nvim-cmp------------------
  use 'neovim/nvim-lspconfig'
  use "williamboman/nvim-lsp-installer"
  use "rafamadriz/friendly-snippets"
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  ------------hop.nvim----------------
  use {
  'phaazon/hop.nvim',
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  }

  --------------neoscroll.nvim------------
  use({
      "karb94/neoscroll.nvim",
      event = "VimEnter"
    })

  --------------neoformat-----------------
  use 'sbdchd/neoformat'

  --------------wilder.nvim----------------
  use({"gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]]})
  
  ---------better-escape.vim---------------
  use({ "jdhao/better-escape.vim", event = { "InsertEnter" } })
  
  ----------------autopairs----------------
  use {
	"windwp/nvim-autopairs"}

  ----------catppuccin--------------
  --use { "catppuccin/nvim", as = "catppuccin" }
  --require("catppuccin").setup()
  --vim.cmd [[colorscheme catppuccin]]
 
  ----------gruv-box----------------
  use 'sainnhe/gruvbox-material'
  vim.cmd [[colorscheme gruvbox-material]]
  -----------feline.nvim------------
  use 'feline-nvim/feline.nvim'

  if packer_bootstrap then
    require('packer').sync()
    end

-------cmp setup --------
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
  servers = {"ccls"
  }
  for _,server in ipairs(servers) do 
    require('lspconfig')[server].setup {
    capabilities = capabilities 
    }
    end
  end
)
