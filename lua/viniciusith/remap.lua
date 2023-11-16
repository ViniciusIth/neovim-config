vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Escape with jj
keymap.set({"i"}, "jj", "<esc>")

-- Allow moving when line selected
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- Tmux-sessionizer
-- keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Dunno exactly how it works, but it makes things executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
