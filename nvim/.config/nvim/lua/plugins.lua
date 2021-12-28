local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
    return string.format("require(\"config/%s\")", name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git", "clone", "https://github.com/wbthomason/packer.nvim",
        install_path
    })
    execute "packadd packer.nvim"
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use
packer.reset()

-- actual plugins list
use "wbthomason/packer.nvim"

-- >> !!! telescope is missing BurntSuhi/ripgrep (:checkhealth telescope)
use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
    config = get_config("telescope")
}

-- >> File Explorer like nertree
use {"kyazdani42/nvim-tree.lua", config = get_config("nvim-tree")}

-- >> navigation between splits and panes with Ctrl+hjkl
use {"numToStr/Navigator.nvim", config = get_config("navigator")}

-- >> bottom status line
use {
    "nvim-lualine/lualine.nvim",
    config = get_config("lualine"),
    event = "VimEnter",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
}

-- >> colorize HEX codes
use {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = get_config("colorizer")
}

-- >> comment lines ON/OFF with gc/gcc
use {
    "numToStr/Comment.nvim",
    opt = true,
    keys = {"gc", "gcc"},
    config = get_config("comment")
}

-- >> auto pairs (){}[]""''
use {"windwp/nvim-autopairs", config = get_config("autopairs")}

use {
    "nvim-treesitter/nvim-treesitter",
    config = get_config("treesitter"),
    run = ":TSUpdate"
}

use "nvim-treesitter/nvim-treesitter-textobjects"

use {
    "hrsh7th/nvim-cmp",
    requires = {
        {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
        {"hrsh7th/cmp-cmdline"}, {"hrsh7th/cmp-vsnip"},
        {"f3fora/cmp-spell", {"hrsh7th/cmp-calc"}, {"hrsh7th/cmp-emoji"}}
    },
    config = get_config("cmp")
}

use {"hrsh7th/vim-vsnip", config = get_config("vsnip")}

use {"rafamadriz/friendly-snippets", requires = {{"hrsh7th/vim-vsnip"}}}

use {
    "mhartington/formatter.nvim",
    event = "BufWritePre",
    config = get_config("formatter")
}

-- requirement for Neogit
use {
    "sindrets/diffview.nvim",
    cmd = {
        "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles",
        "DiffviewFocusFiles"
    },
    config = get_config("diffview")
}

use {
    "TimUntersberger/neogit",
    requires = {"nvim-lua/plenary.nvim"},
    cmd = "Neogit",
    config = get_config("neogit")
}

use {"f-person/git-blame.nvim", config = get_config("git-blame")}

use {
    "lewis6991/gitsigns.nvim",
    requires = {"nvim-lua/plenary.nvim"},
    event = "BufReadPre",
    config = get_config("gitsigns")
}
-- >> module for treesitter, color per pair of brackets (){}[]
use "p00f/nvim-ts-rainbow"

-- >> better quickfix window
use {
    "kevinhwang91/nvim-bqf",
    requires = {{"junegunn/fzf", module = "nvim-bqf"}}
}

-- >> telescope fuzzy finder
use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}



use {
    "akinsho/nvim-bufferline.lua",
    requires = "kyazdani42/nvim-web-devicons",
    event = "BufReadPre",
    config = get_config("bufferline")
}

use "famiu/bufdelete.nvim"

use {"neovim/nvim-lspconfig", config = get_config("lsp")}

use {"ray-x/lsp_signature.nvim", requires = {{"neovim/nvim-lspconfig"}}}

use {"onsails/lspkind-nvim", requires = {{"famiu/bufdelete.nvim"}}}

use {
    "simrat39/symbols-outline.nvim",
    cmd = {"SymbolsOutline"},
    config = get_config("symbols")
}

-- >> display indentations
use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = [[require("config/indent-blankline")]]
}

-- -- >> open terminal on the side with Ctrl+y
-- use {
--     "akinsho/nvim-toggleterm.lua",
--     keys = {"<C-y>", "<leader>fl", "<leader>gt"},
--     config = get_config("toggleterm")
-- }

-- -- >> something to enclose text with brackets/quotes
-- use {
--     "blackCauldron7/surround.nvim",
--     config = function()
--         vim.g.surround_mappings_style = "surround"
--         require"surround".setup {}
--     end
-- }

-- >> markup into presentation slides
-- use "sotte/presenting.vim"




-- >> A pretty list for showing diagnostics, references, telescope results,
-- >> quickfix and location lists to help you solve all the trouble your code is causing.
use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = {"TroubleToggle", "Trouble"},
    config = get_config("trouble")
}

use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    cmd = {"TodoTrouble", "TodoTelescope"},
    event = "BufReadPost",
    config = get_config("todo")
}

use {"ahmedkhalf/project.nvim", config = get_config("project")}

-- >> highlight similar text instances with * or #
use "ironhouzi/starlite-nvim"

-- >> automatically highlighting (underlines( other uses of the current word under the cursor
-- >> used inside the Doom-One config
use {"RRethy/vim-illuminate", event = "CursorHold"}


-- >> display popup with key options (when pressing space)
use {"folke/which-key.nvim", event = "VimEnter", config = get_config("which")}

-- >> great plugin to align blocks of text
use "junegunn/vim-easy-align" -- no lua alternative

-- >> grammar check
-- use {"rhysd/vim-grammarous", cmd = "GrammarousCheck"}

-- >> floating window with navigation (buggy on my config with Xmonad)
-- use {
--     "ptzz/lf.vim",
--     requires = "voldikss/vim-floaterm",
--     config = get_config("lf")
-- }

-- >> Doom Emacs' color scheme (amazing)
use {"NTBBloodbath/doom-one.nvim", config = get_config("doom-one")}

-- >> not installed properly, something is broken
-- use {
--     "ThePrimeagen/harpoon", keys = {
--         "<leader>ha", "<leader>hu", "<leader>h1", "<leader>h1", "<leader>h3",
--         "<leader>h4"
--     },
--     requires = {"nvim-lua/plenary.nvim"}
-- }

-- >> centers text with black borders around, dim text outside of a certain range with the Twilight plugin (optional)
use {"folke/zen-mode.nvim", cmd = "ZenMode", config = get_config("zen-mode")}
use {"folke/twilight.nvim", config = get_config("twilight")}


-- >> breaks down what takes time to load when opening VIM+a file (could save a few milliseconds!)
-- use {"tweekmonster/startuptime.vim"}

-- >> make the BG transparent: needed to keep the terminal BG color as Nvim BG color
use {"xiyaowong/nvim-transparent", config = get_config("transparent")}


-- >> used to preview Markdown files in a browser
use {
    "iamcco/markdown-preview.nvim",
    run = function()
        vim.fn["mkdp#util#install"]()
    end,
    ft = {"markdown"},
    config = get_config("markdown-preview")
}

-- >> faster navigation within text
use {"ggandor/lightspeed.nvim", event = "BufReadPre"}

use {"jvgrootveld/telescope-zoxide"}

use("crispgm/telescope-heading.nvim")

-- TODO: ????
-- https://github.com/glepnir/lspsaga.nvim
-- use 'glepnir/lspsaga.nvim'
-- Too intrusive (fFtT, sS zZ, xX ...)
-- https://github.com/ggandor/lightspeed.nvim


-- use 'ggandor/lightspeed.nvim'




