
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- >> Python
-- >> execute the python file I'm editting
vim.keymap.set("n","<M-p>",':w!<CR>:!python3 %<CR>')

-- Rust
-- >> compile and run current RUST Cargo
vim.keymap.set("n","<M-g>",':w!<CR>:!cargo run<CR>')
vim.keymap.set("n","<M-b>",':w!<CR>:!cargo build<CR>')
-- >> Rust Formatter / Clippy / OpenCargo / InlayHints
vim.keymap.set("n","<M-f>",':w!<CR>:!cargo fmt<CR>')
vim.keymap.set("n","<M-F>",':w!<CR>:!cargo clippy<CR>')
vim.keymap.set("n","<M-c>",':RustOpenCargo<CR>')
vim.keymap.set("n","<M-i>",':RustSetInlayHints<CR>')
-- >> Rust keep test code
vim.keymap.set("n","<M-d>",':read ~/.config/nvim/macros/deadcode<CR>]')

-- >> Clang-Format
vim.keymap.set("n","<M-s>",':w!<CR>:%!clang-format<CR>')

-- go to my projects
vim.keymap.set('n', '<leader>o', ':lua require("telescope.builtin").find_files{cwd="/home/bunker/projects/aliases/",follow=true,search_file="*.*"}<CR>')

  -- move vertically and center
vim.keymap.set('n','<A-j>','5jzz')
vim.keymap.set('n','<A-k>','5kzz')
vim.keymap.set('n','<C-d>','<C-d>zz')
vim.keymap.set('n','<C-u>','<C-u>zz')

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

