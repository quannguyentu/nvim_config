# My Neovim Config

Personal Neovim setup built with [lazy.nvim](https://github.com/folke/lazy.nvim).

yes

## Requirements

- Neovim >= 0.10
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- `ripgrep` and `fd` (for fuzzy finding / grep)
- Node.js (for some LSP servers via Mason)

## Installation

```bash
git clone <your-repo-url> ~/.config/nvim
nvim
```
Plugins install automatically on first launch via lazy.nvim.

## Structure

```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── config/       -- options, keymaps, autocmds
│   └── plugins/       -- one file per plugin or plugin group
└── README.md
```

## Plugins

> Add a new row here every time you add a plugin. Keep categories grouped; add a new category heading if none fit.

### Plugin Manager

| Plugin | Purpose | Notes |
|---|---|---|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager | `lua/config/lazy.lua` |

### LSP / Completion

| Plugin | Purpose | Notes |
|---|---|---|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration | `lua/plugins/nvim-lspconfig.lua` |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Install LSP servers/linters/formatters | `lua/plugins/nvim-lspconfig.lua` (dep) |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridges mason + lspconfig | `lua/plugins/nvim-lspconfig.lua` (dep) |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion | `lua/plugins/nvim-cmp.lua` |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine | `lua/plugins/nvim-cmp.lua` (dep) |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | Snippet source for nvim-cmp | `lua/plugins/nvim-cmp.lua` (dep) |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP completion source | `lua/plugins/nvim-cmp.lua` (dep) |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Buffer completion source | `lua/plugins/nvim-cmp.lua` (dep) |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | Path completion source | `lua/plugins/nvim-cmp.lua` (dep) |
| [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) | Cmdline completion source | `lua/plugins/nvim-cmp.lua` (dep) |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | VSCode-style snippets | `lua/plugins/nvim-cmp.lua` (dep) |
| [lspkind.nvim](https://github.com/onsails/lspkind.nvim) | Nerd Font icons for completion | `lua/plugins/nvim-cmp.lua` (dep) |

### Syntax

| Plugin | Purpose | Notes |
|---|---|---|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting / parsing | `lua/plugins/nvim-treesitter.lua` |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | Treesitter text objects | `lua/plugins/nvim-treesitter.lua` (dep) |

### Navigation / Fuzzy Finding

| Plugin | Purpose | Notes |
|---|---|---|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder | `lua/plugins/telescope.lua` |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF native sorter | `lua/plugins/telescope.lua` (dep) |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utilities (telescope dep) | `lua/plugins/telescope.lua` (dep) |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File explorer (replaces netrw) | `lua/plugins/oil.lua` |

### Git

| Plugin | Purpose | Notes |
|---|---|---|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git gutter signs, hunks, blame | `lua/plugins/gitsigns.lua` |

### Editing

| Plugin | Purpose | Notes |
|---|---|---|
| [flash.nvim](https://github.com/folke/flash.nvim) | Jump/motion enhancement | `lua/plugins/flash.lua` |
| [mini.surround](https://github.com/nvim-mini/mini.nvim) | Surround text objects | `lua/plugins/nvim-mini.lua` |
| [mini.ai](https://github.com/nvim-mini/mini.nvim) | Better text objects | `lua/plugins/nvim-mini.lua` |
| [mini.pairs](https://github.com/nvim-mini/mini.nvim) | Auto-close brackets/quotes | `lua/plugins/nvim-mini.lua` |

### UI

| Plugin | Purpose | Notes |
|---|---|---|
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline | `lua/plugins/nvim-lualine.lua` |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding hints | `lua/plugins/which-key.lua` |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | Notification replacement | `lua/plugins/nvim-notify.lua` |
| [smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim) | Smooth cursor animation | `lua/plugins/smear-cursor.lua` |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Markdown rendering | `lua/plugins/render-markdown.lua` |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File/icons | `lua/plugins/nvim-lualine.lua` (dep) |
| [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) | Modern fold engine | `lua/plugins/ufo.lua` |
| [promise-async](https://github.com/kevinhwang91/promise-async) | Async lib (ufo dep) | `lua/plugins/ufo.lua` (dep) |

### Colorscheme

| Plugin | Purpose | Notes |
|---|---|---|
| [everforest](https://github.com/sainnhe/everforest) | Colorscheme (active) | `lua/plugins/colorschemes.lua` |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Colorscheme (fallback) | `lua/plugins/colorschemes.lua` |

### AI / Assistant

| Plugin | Purpose | Notes |
|---|---|---|
| [pi.nvim](https://github.com/pablopunk/pi.nvim) | AI coding assistant | `lua/plugins/pi-dev.lua` |

### Formatting

| Plugin | Purpose | Notes |
|---|---|---|
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatter runner | `lua/plugins/conform.lua` |

---

## Keymaps

> Document custom (non-default) keymaps here as you add them.

| Key | Mode | Action |
|---|---|---|
| `<leader>e` | Normal | Open file explorer |
| `<leader>ff` | Normal | Find files |
| `<leader>fg` | Normal | Live grep |

## TODO / Ideas

- [ ] Install all initial listed plugins.
- [ ] Automate getting plugins list from lazy.nvim for documentation

## Changelog

> Optional: track notable changes over time.

- **08/18/2025** — Initial config setup README.md