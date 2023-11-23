local set = vim.opt
local global = vim.g

-- Disable netrw
global.loaded_netrw = 1
global.loaded_netrwPlugin = 1

-- Activate line number and make them relative
set.nu = true
set.relativenumber = true

-- Change indentation size to 4
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true

-- Disable swapfiles and activate long undo
set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.config/nvim/plugin/.undodir"
set.undofile = true

-- Makes highlights appear only on one find
set.hlsearch = false
set.incsearch = true

set.termguicolors = true

-- Text is farther away from bottom
set.scrolloff = 8
set.signcolumn = "yes"
set.isfname:append("@-@")

-- Faster updates
set.updatetime = 50

-- place a column on right to alert for long code
set.colorcolumn = "80"
