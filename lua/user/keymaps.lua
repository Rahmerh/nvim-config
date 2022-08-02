local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Markdown
keymap("n", "<C-m>", "<cmd>CocCommand markdown-preview-enhanced.openPreview<cr>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- HTOP
keymap("n", "<C-q>", ":lua _HTOP_TOGGLE()<cr>", opts)

-- Hop
keymap("n", "<C-g>", "<cmd>HopWord<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "R", "<comd>NvimTreeRefresh<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
keymap("i", "jk", "<ESC>", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal --
keymap("n", "<C-/>", ":LazyGit<cr>", opts)
keymap("n", "<C-\\>", "<cmd>FloatermToggle<cr>", opts)
keymap("t", "<C-\\>", "<C-\\><C-N><cmd>FloatermToggle<cr>", opts)

keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap(
    "n",
    "<leader>f",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown())<cr>",
    opts
)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>po", "<cmd>Telescope projects<cr>", opts)

-- Tagbar
keymap("n", "<leader>t", "<cmd>TagbarToggle<cr>", opts)

-- Diagnostics
keymap("n", "<C-l>", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<C-.>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

-- Formatting
keymap("n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
keymap("n", "<leader>o", "<cmd>lua require'jdtls'.organize_imports()<cr>", opts)
keymap("n", "RR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

-- Debugging
keymap("n", "<F5>", "<cmd>DapContinue<cr>", opts)
keymap("n", "<F10>", "<cmd>DapStepOver<cr>", opts)
keymap("n", "<F11>", "<cmd>DapStepInto<cr>", opts)
keymap("n", "<S-F11>", "<cmd>DapStepOut<cr>", opts)
keymap("n", "<S-F5>", "<cmd>DapTerminate<cr>", opts)
keymap("n", "<C-b>", "<cmd>DapToggleBreakpoint<cr>", opts)
keymap("n", "tn", "<cmd>lua require'jdtls'.test_nearest_method()<cr>", opts)
keymap("n", "tc", "<cmd>lua require'jdtls'.test_class()<cr>", opts)
