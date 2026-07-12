local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.clipboard = "unnamedplus"
opt.splitright = true
opt.splitbelow = true
opt.undofile = true
opt.updatetime = 200
opt.timeoutlen = 250
opt.completeopt = "menu,menuone,noselect"
opt.mouse = "a"
opt.showmode = false
opt.fillchars = { eob = " " }
opt.lazyredraw = false
opt.synmaxcol = 200
opt.ttyfast = true
opt.virtualedit = "block"
opt.cmdheight = 1
opt.cmdwinheight = 5

-- Native cmdline completion (Neovim 0.12+)
opt.wildmode = "noselect:lastused,full"
opt.wildoptions = "pum,fuzzy"
opt.wildignorecase = true

-- Ensure cmdline is visible with catppuccin
vim.api.nvim_set_hl(0, "Cmdline", { bg = "#1e1e2e", fg = "#cdd6f4", bold = true })
vim.api.nvim_set_hl(0, "MsgArea", { bg = "#1e1e2e", fg = "#cdd6f4" })
