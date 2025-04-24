-- General Settings
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = true

-- Tabs and Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Mouse Support
vim.opt.mouse = "a"
-- vim.opt.guicursor = "n-v-c-sm:ver25,i-ci-ve:ver25,r-cr:hor20,o:hor50"

-- Split Management
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Keymaps
require("config.keymaps")

-- Lazy Plugins 
require("config.lazy")
require("lazy").setup("plugins")
