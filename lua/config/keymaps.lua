local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- duplicate lines ->
keymap.set({ "n" }, "<S-a>", "<CMD>LineDuplicate +1<CR>")
keymap.set({ "v" }, "<S-z>", "<CMD>VisualDuplicate +1<CR>")

-- folding methods ->
keymap.set("n", "zr", require("ufo").openAllFolds)
keymap.set("n", "zm", require("ufo").closeAllFolds)

-- Bufferline
keymap.set("n", "<C-w>", "<cmd><leader>bd<CR>", { desc = "Close Buffer" })
keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })

-- quit ->
keymap.set("n", "<C-q>", "<CMD>q<CR>", { desc = "close windows" })

-- treejs ->
keymap.set("n", "<C-j>", require("treesj").toggle)
keymap.set("n", "C-j", function()
  require("treesj").toggle({ split = { recursive = true } })
end)

-- delete word ->
keymap.set("n", "dw", 'vb"_d', { desc = "delete unique word" })

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window ->
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window ->
keymap.set("n", "<C-left>", "<C-w><")
keymap.set("n", "<C-right>", "<C-w>>")
keymap.set("n", "<C-up>", "<C-w>+")
keymap.set("n", "<C-down>", "<C-w>-")

-- back code
keymap.set({ "n", "i" }, "<C-z>", "<cmd>u<CR>")

-- Movement in code ->
keymap.set("n", "<Tab>", '"+e')

-- Copy & Paste ->
keymap.set("x", "<C-c>", '"+y')
keymap.set("n", "<C-c>", "yy")
keymap.set("n", "<C-v>", '"+p')
keymap.set("i", "<C-v>", "<C-r>+")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
