local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true -- ← critical for motion counts
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "↪ "
opt.termguicolors = true
opt.pumheight = 10
opt.winborder = "rounded" -- Neovim 0.11+

-- Editting

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
