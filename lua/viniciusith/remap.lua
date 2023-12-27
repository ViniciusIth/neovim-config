vim.g.mapleader = " "

local keymap = vim.keymap

-- keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Save with <leader>w
keymap.set("n", "<leader>w", ":w<CR>")

-- Escape with jj
keymap.set({ "i" }, "jj", "<esc>")

-- Allow moving when line selected
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Format with leader f
keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>")

-- Tmux-sessionizer
-- keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Dunno exactly how it works, but it makes things executable
-- keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Buffer navigation
keymap.set("n", "<C-h>", ":bp!<CR>", { silent = true })
keymap.set("n", "<C-l>", ":bn!<CR>", { silent = true })
keymap.set("n", "<leader>q", ":bd<CR>", { silent = true })

-- keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
-- keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
-- keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
-- keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
