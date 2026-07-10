local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local noremap_opts = { noremap = false, silent = true }

vim.g.mapleader = " "

map("i", "jk", "<Esc>", opts)
map("i", "jj", "<Esc>", opts)
map("i", "kj", "<Esc>", opts)

map("n", "<leader>w", "<cmd>w<cr>", opts)
map("n", "<leader>q", "<cmd>q<cr>", opts)
map("n", "<leader>h", "<cmd>nohlsearch<cr>", opts)

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "<A-j>", ":m .+1<cr>==", opts)
map("n", "<A-k>", ":m .-2<cr>==", opts)
map("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)

map("n", "<leader>e", "<cmd>Neotree toggle<cr>", opts)
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>gs", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>s", "<cmd>Telescope git_status<cr>", opts)
map("n", "<leader>gg", "<cmd>Neogit<cr>", opts)
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", opts)
map("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", opts)

map("n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<cr>", opts)
map("n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<cr>", opts)
map("n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<cr>", opts)
map("n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<cr>", opts)
map("n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<cr>", opts)

map("n", "<leader>x", "<cmd>bdelete<cr>", opts)
map("n", "<S-l>", "<cmd>bnext<cr>", opts)
map("n", "<S-h>", "<cmd>bprevious<cr>", opts)

map("n", "gl", "$", opts)
map("n", "gh", "0", opts)

map("t", "<Esc>", "<C-\\><C-n>", opts)
map("t", "jk", "<C-\\><C-n>", opts)
