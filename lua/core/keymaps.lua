local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- File / basics
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear highlight" })

-- Redo on Shift+U (Ctrl+r still works too); replaces Vim's default undo-line U.
map("n", "U", "<C-r>", { desc = "Redo" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Keep selection when indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move lines up/down
-- WARNING: <A-j>/<A-k> may trigger accidentally with CapsLock→Esc mapping.
-- Fast "Caps then j/k" produces Esc+j/k → interpreted as Alt+j/k.
map("n", "<A-j>", ":m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
map("n", "<leader>j", ":m .+1<cr>==", { desc = "Move line down" })
map("n", "<leader>k", ":m .-2<cr>==", { desc = "Move line up" })
map("v", "<leader>j", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<leader>k", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Explorer / finders
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "File Explorer" })
-- <leader>f (find_files) and <leader>/ (live_grep) are defined as lazy `keys`
-- in lua/plugins/telescope.lua so they load Telescope on demand.

-- Buffers (grouped under <leader>b to avoid prefix conflicts)
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "List Buffers" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
-- Buffer 1..5 via <leader> instead of Alt to avoid the CapsLock-as-Esc / Meta ambiguity.
for i = 1, 5 do
  map("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<cr>", { desc = "Go to buffer " .. i })
end

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
