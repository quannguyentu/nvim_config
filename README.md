# My Neovim Config

Personal Neovim setup built with [lazy.nvim](https://github.com/folke/lazy.nvim).

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
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager | |

### LSP / Completion

| Plugin | Purpose | Notes |
|---|---|---|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration | |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Install LSP servers/linters/formatters |nvim-lspconfig.lua as dependancy |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridges mason + lspconfig |nvim-lspconfig.lua as dependancy |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion |  |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippets | nvim-cmp.lua as dependancy |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippets | nvim-cmp.lua as dependancy |


### Syntax

| Plugin | Purpose | Notes |
|---|---|---|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting / parsing | |

### Navigation / Fuzzy Finding

| Plugin | Purpose | Notes |
|---|---|---|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder | |

### Git

| Plugin | Purpose | Notes |
|---|---|---|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git gutter signs, hunks, blame | |

### Editing

| Plugin | Purpose | Notes |
|---|---|---|
| [mini.surround](https://github.com/nvim-mini/mini.nvim) | Surround text objects | part of mini.nvim |
| [mini.ai](https://github.com/nvim-mini/mini.nvim) | Better text objects | part of mini.nvim |
| [mini.pairs](https://github.com/nvim-mini/mini.nvim) | Auto-close brackets/quotes | part of mini.nvim |

### UI

| Plugin | Purpose | Notes |
|---|---|---|
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline | |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding hints | |

### Colorscheme

| Plugin | Purpose | Notes |
|---|---|---|
| _(add your colorscheme here)_ | | |

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
