
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

-- >> Packer Plugin !!!
use "wbthomason/packer.nvim"

-- >> Doom Emacs' color scheme
use {"NTBBloodbath/doom-one.nvim", config = get_config("doom-one")}
-- >> make the BG transparent: needed to keep the terminal BG color as Nvim BG color
use {"xiyaowong/nvim-transparent", config = get_config("transparent")}

-- >> faster navigation in text
 use{
    "phaazon/hop.nvim",
    event = "BufReadPre",
    config = get_config("hop")
 }

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

-- >> display indentations
use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = [[require("config/indent-blankline")]]
}

-- >> navigation between splits and panes with Ctrl+hjkl
use {"numToStr/Navigator.nvim", config = get_config("navigator")}

-- >> telescope
use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
    config = get_config("telescope")
}

-- >> telescope fuzzy finder
use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

use {"jvgrootveld/telescope-zoxide"}
use("crispgm/telescope-heading.nvim")

-- >>telescope requires this: requires nvim-tree
use {"ahmedkhalf/project.nvim", config = get_config("project")}

-- >> telescope requires this: File Explorer like nertree (required for ahmedkhalf/project)
use {"kyazdani42/nvim-tree.lua", config = get_config("nvim-tree")}


-- ?>  TreeSitter
use {
    "nvim-treesitter/nvim-treesitter",
    config = get_config("treesitter"),
    run = ":TSUpdate"
}
use "nvim-treesitter/nvim-treesitter-textobjects"


-- >> autocomplete
use {
    "hrsh7th/nvim-cmp",
    requires = {
      {"hrsh7th/cmp-nvim-lsp"},
      { "hrsh7th/cmp-nvim-lua" },
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"hrsh7th/cmp-cmdline"},
      { "hrsh7th/vim-vsnip-integ" },
      {"f3fora/cmp-spell", {"hrsh7th/cmp-calc"}, {"hrsh7th/cmp-emoji"}}
    },
    config = get_config("cmp")
}


-- LSP config
--use "famiu/bufdelete.nvim" !!! turning this ON makes neovim shits itself!!! all plugins break
use {"neovim/nvim-lspconfig", config = get_config("lsp")}
use {"ray-x/lsp_signature.nvim", requires = {{"neovim/nvim-lspconfig"}}}
use {"onsails/lspkind-nvim", requires = {{"famiu/bufdelete.nvim"}}}

-- >> display popup with key options (when pressing space)
use {"folke/which-key.nvim", event = "VimEnter", config = get_config("which")}

-- >> automatically highlighting (underlines( other uses of the current word under the cursor
-- >> used inside the Doom-One config
use {"RRethy/vim-illuminate", event = "CursorHold"}

-- >> highlight similar text instances with * or #
use "ironhouzi/starlite-nvim"



