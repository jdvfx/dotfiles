-- local map = vim.api.nvim_set_keymap
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


default_options = {noremap = true, silent = true}
expr_options = {noremap = true, expr = true, silent = true}

-- map the leader key
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", default_options)
vim.g.mapleader = " "


-- center search results
map("n", "n", "nzz", default_options)
map("n", "N", "Nzz", default_options)

-- better indenting
map("v", "<", "<gv", default_options)
map("v", ">", ">gv", default_options)

-- paste over currently selected text without yanking it
map("v", "p", "\"_dP", default_options)

-- Tab switch buffer
map("n", "<TAB>", ":bnext<CR>", default_options)
map("n", "<S-TAB>", ":bprevious<CR>", default_options)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_options)

-- Resizing panes
map("n", "<Left>", ":vertical resize +1<CR>", default_options)
map("n", "<Right>", ":vertical resize -1<CR>", default_options)
map("n", "<Up>", ":resize -1<CR>", default_options)
map("n", "<Down>", ":resize +1<CR>", default_options)

-- Deal with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", default_options)
map("x", "J", ":move '>+1<CR>gv-gv", default_options)

-- BUNKER
-- Save and Load session
map("n","W",":mks! ~/sesh.vim<CR>",default_options)
map("n","Q",":source ~/sesh.vim<CR>",default_options)

-- BUNKER
-- >> execute the python file I'm editting
map("n","|",':w<CR>:!python %<CR>',default_options)
map("v","|",':w<CR>:!python %<CR>',default_options)

-- PLUGINS
-- Hop
map("n", "<leader>j", "<cmd>lua require'hop'.hint_words()<cr>",default_options)
map("n", "<leader>k", "<cmd>lua require'hop'.hint_lines()<cr>",default_options)
map("v", "<leader>j", "<cmd>lua require'hop'.hint_words()<cr>",default_options)
map("v", "<leader>k", "<cmd>lua require'hop'.hint_lines()<cr>",default_options)

-- telescope
map("n", "<leader>p", '<cmd>lua require("telescope.builtin").find_files()<cr>')

-- LSP
map("n", "K" , '<cmd>lua vim.lsp.buf.hover()<cr>', default_options)
map("n", "gd" , '<cmd>lua vim.lsp.buf.definition()<cr>', default_options)
map("n", "gr" , '<cmd>lua vim.lsp.buf.rename()<cr>', default_options)


