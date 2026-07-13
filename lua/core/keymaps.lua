local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- File / basics
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear highlight" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Keep selection when indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move lines up/down
map("n", "<A-j>", ":m .+1<cr>==", opts)
map("n", "<A-k>", ":m .-2<cr>==", opts)
map("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)

-- Explorer / finders
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "File Explorer" })
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })

-- Buffers (grouped under <leader>b to avoid prefix conflicts)
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "List Buffers" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<cr>", opts)
map("n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<cr>", opts)
map("n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<cr>", opts)
map("n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<cr>", opts)
map("n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<cr>", opts)

-- Git
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })
map("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diff View" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", { desc = "Git History" })

-- Line start/end
map("n", "gl", "$", opts)
map("n", "gh", "0", opts)

-- Terminal: escape to normal mode
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- Open current PDF in SumatraPDF (capital P avoids clashing with <leader>o outline)
map("n", "<leader>P", function()
  local file = vim.fn.expand("%:p")
  if file:match("%.pdf$") then
    vim.fn.jobstart({ "cmd", "/c", "start", "SumatraPDF", file }, { detach = true })
  else
    vim.notify("Not a PDF file", vim.log.levels.WARN)
  end
end, { noremap = true, silent = true, desc = "Open PDF in SumatraPDF" })
