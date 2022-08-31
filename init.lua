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
  use "rafamadriz/friendly-snippets"
  use 'L3MON4D3/LuaSnip'
  use { 'saadparwaiz1/cmp_luasnip' }
 



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
  -- The missing auto-completion for cmdline!
  use({"gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]]})
  ---------better-escape.vim---------------
  use({ "jdhao/better-escape.vim", event = { "InsertEnter" } })
  ----------------autopairs----------------
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {}
    end}
  if packer_bootstrap then
    require('packer').sync()
    end


--[[-------cmp setup --------
local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

require('luasnip.loaders.from_vscode').lazy_load()
vim.api.nvim_command('hi LuasnipChoiceNodePassive cterm=italic')

vim.opt.completeopt = 'menu,menuone,noselect'

cmp.setup({
    snippet = {
        expand = function(args)
           -- require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {
        format = function(entry, item)
            local menu_map = {
                buffer = '[Buf]',
                nvim_lsp = '[LSP]',
                nvim_lua = '[API]',
                path = '[Path]',
                luasnip = '[Snip]',
                rg = '[RG]',
            }

            item.menu = menu_map[entry.source.name] or string.format('[%s]', entry.source.name)
            item.kind = vim.lsp.protocol.CompletionItemKind[item.kind]

            return item
        end,
    },
    window = {
        completion = {
            border = 'rounded',
            winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
        },
        documentation = {
            border = 'rounded',
            winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
        },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete()),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-n>'] = {
            c = function(fallback)
                local cmp = require('cmp')
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
        },
        ['<C-p>'] = {
            c = function(fallback)
                local cmp = require('cmp')
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,
        },
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 10 },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
    }, {
        { name = 'nvim_lua' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'rg' },
    }),
})

-- https://github.com/windwp/nvim-autopairs
require('nvim-autopairs').setup()--]]
  end
)
