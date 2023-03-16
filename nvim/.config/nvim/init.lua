-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                                                    -- Package manager
  use 'tpope/vim-fugitive'                                                        -- Git commands in nvim
  use 'tpope/vim-rhubarb'                                                         -- Fugitive-companion to interact with github
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }       -- Add git related info in the signs columns and popups
  use 'numToStr/Comment.nvim'                                                     -- "gc" to comment visual regions/lines
  use 'nvim-treesitter/nvim-treesitter'                                           -- Highlight, edit, and navigate code
  use 'nvim-treesitter/nvim-treesitter-textobjects'                               -- Additional textobjects for treesitter
  use 'neovim/nvim-lspconfig'                                                     -- Collection of configurations for built-in LSP client
  use 'williamboman/nvim-lsp-installer'                                           -- Automatically install language servers to stdpath
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }               -- Autocompletion
  use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }           -- Snippet Engine and Snippet Expansion
  -- use 'mjlbach/onedark.nvim'                                                      -- Theme inspired by Atom
  use 'nvim-lualine/lualine.nvim'                                                 -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim'                                       -- Add indentation guides even on blank lines
  use 'tpope/vim-sleuth'                                                          -- Detect tabstop and shiftwidth automatically

  -- >> colorize HEX codes
  use 'norcalli/nvim-colorizer.lua'
  -- >> faster navigation in text
  use 'phaazon/hop.nvim'
  -- >> navigation between splits and panes with Ctrl+hjkl
  use 'numToStr/Navigator.nvim'
  -- >> colorscheme
  use "tiagovla/tokyodark.nvim"

  -- RustTools for RustToggleInlayHints
  use 'simrat39/rust-tools.nvim'

  -- LSP loading 
  use 'j-hui/fidget.nvim'



-- TS rainbow
  use "p00f/nvim-ts-rainbow"

  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Fuzzy Finder (files, lsp, etc)

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }


  if is_bootstrap then
    require('packer').sync()
  end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true -- set relative numbered lines

-- BUNKER
vim.wo.cursorline = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
-- BUNKER says: I don't want that.
-- vim.o.ignorecase = true
-- vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
-- vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- BUNKER
-- allow Neovim to access the system clipboard
vim.o.clipboard = "unnamedplus"
-- do not redraw screen while running macros
vim.o.lazyredraw = true


-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- BUNKER 
-- paste over currenly selected text without yanking it 
vim.keymap.set('v','p','\"_dP')


-- comments
-- vim.keymap.set('n','<leader>g','gcc',{silent = true})

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = false,
    -- theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}

-- Enable Comment.nvim
require('Comment').setup()

-- fidget LSP loader
require('fidget').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
--
-- BUNKER - leader+p to find files in the current project
vim.keymap.set('n', '<leader>p', require('telescope.builtin').find_files,{})

--local bo = "/home/bunker/Downloads"
--vim.keymap.set('n', '<leader>o', require('telescope.builtin').find_files,{cwd=bo})




-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'lua', 'typescript', 'rust', 'go', 'python' },

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      -- TODO: I'm not sure for this one.
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
  rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 2000,
      colors = {
        "#ffffff",
        "#feff9a",
        "#ff8e1f",
        "#b848ff",
        "#2255ff",
        "#50d6cf",
        "#06bc75",
      }
  }
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', require('telescope.builtin').lsp_references)
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', vim.lsp.buf.format or vim.lsp.buf.formatting, { desc = 'Format current buffer with LSP' })
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }

-- Ensure the servers above are installed
require('nvim-lsp-installer').setup {
  ensure_installed = servers,
}

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- require('lspconfig').sumneko_lua.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = runtime_path,
--       },
--       diagnostics = {
--         globals = { 'vim' },
--       },
--       workspace = { library = vim.api.nvim_get_runtime_file('', true) },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = { enable = false, },
--     },
--   },
-- }

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- BUNKER
require("rust-tools").setup({
    tools = {
      inlay_hints = {
        highlight = "InlayHints"
      }
    },
})

vim.g.tokyodark_transparent_background = true
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = false
vim.g.tokyodark_color_gamma = "1.0"
vim.g.tokyodark_color_mult = "1.0"
vim.cmd("colorscheme tokyodark")

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

default_options = {noremap = true, silent = true}
expr_options = {noremap = true, expr = true, silent = true}

-- Resizing panes
map("n", "<Left>", ":vertical resize +3<CR>", default_options)
map("n", "<Right>", ":vertical resize -3<CR>", default_options)
map("n", "<Up>", ":resize -3<CR>", default_options)
map("n", "<Down>", ":resize +3<CR>", default_options)

-- >> Python
-- >> execute the python file I'm editting
map("n","<M-p>",':w!<CR>:!python3 %<CR>',default_options)

-- Rust
-- >> compile and run current RUST Cargo
map("n","<M-g>",':w!<CR>:!cargo run<CR>',default_options)
map("n","<M-b>",':w!<CR>:!cargo build<CR>',default_options)

-- >> Rust Formatter / Clippy / OpenCargo
map("n","<M-f>",':w!<CR>:!cargo fmt<CR>',default_options)
map("n","<M-F>",':w!<CR>:!cargo clippy<CR>',default_options)
map("n","<M-c>",':RustOpenCargo<CR>',default_options)

map("n","<M-i>",':RustSetInlayHints<CR>',default_options)
-- map("n","<M-z>",':ZenMode<CR>',default_options)

-- >> Rust keep test code
map("n","<M-d>",':read ~/.config/nvim/macros/deadcode<CR>]',default_options)


-- Hop
map("n", "<leader>j", "<cmd>lua require'hop'.hint_words()<cr>",default_options)
map("n", "<leader>k", "<cmd>lua require'hop'.hint_lines()<cr>",default_options)
map("v", "<leader>j", "<cmd>lua require'hop'.hint_words()<cr>",default_options)
map("v", "<leader>k", "<cmd>lua require'hop'.hint_lines()<cr>",default_options)

-- BUNKER
-- colorizer setup
require('colorizer').setup()
local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end
colorizer.setup({ "*" }, {
  RGB = true, -- #RGB hex codes
  RRGGBB = true, -- #RRGGBB hex codes
  RRGGBBAA = true, -- #RRGGBBAA hex codes
  rgb_fn = true, -- CSS rgb() and rgba() functions
  hsl_fn = true, -- CSS hsl() and hsla() functions
  css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
  namess = true, -- "Name" codes like Blue
})

-- BUNKER
-- navigator
-- require('Navigator').setup()
local map = vim.api.nvim_set_keymap
default_options = {noremap = true, silent = true}
-- tmux navigation
map("n", "<C-h>", "<cmd>lua require('Navigator').left()<CR>", default_options)
map("n", "<C-k>", "<cmd>lua require('Navigator').up()<CR>", default_options)
map("n", "<C-l>", "<cmd>lua require('Navigator').right()<CR>", default_options)
map("n", "<C-j>", "<cmd>lua require('Navigator').down()<CR>", default_options)

-- BUNKER
-- hop
require"hop".setup {keys = "qwertyuiopasdfghjklzxcvbnm", term_seq_bias = 0.5}

-- BUNKER
-- rust inlay_hints
require('rust-tools').inlay_hints.enable()

-- the defaut gd above doesn't work ?!
map("n", "gd" , '<cmd>lua vim.lsp.buf.definition()<cr>', default_options)
map("n", "K" , '<cmd>lua vim.lsp.buf.hover()<cr>', default_options)
map("n", "gr" , '<cmd>lua vim.lsp.buf.rename()<cr>', default_options)

-- BUNKER
-- move vertically 
map("n", "<C-j>" , '5jzz', default_options)
map("n", "<C-k>" , '5kzz', default_options)
map("n","<C-d>", "<C-d>zz",default_options)
map("n","<C-u>", "<C-u>zz",default_options)

map("x", "<C-j>" , '5jzz', default_options)
map("x", "<C-k>" , '5kzz', default_options)
map("x","<C-d>", "<C-d>zz",default_options)
map("x","<C-u>", "<C-u>zz",default_options)

-- map('n', '<leader>o', '<cmd>lua require("telescope.builtin").find_files{cwd="/home/bunker/projects/aliases/",follow=true,search_file="/src/*.rs"}<CR>',default_options)
--
map('n', '<leader>o', '<cmd>lua require("telescope.builtin").find_files{cwd="/home/bunker/projects/aliases/",follow=true,search_file="*.*"}<CR>',default_options)
map('n', '<leader>i', '<cmd>lua require("telescope.builtin").jumplist{fname_width=100}<CR>',default_options)



-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
