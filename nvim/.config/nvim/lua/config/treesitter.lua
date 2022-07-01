require"nvim-treesitter.configs".setup {
    ensure_installed = {
        "bash", "cmake", "dockerfile", "go", "hcl", "html", "java",
        "javascript", "json", "latex", "ledger", "lua", "python", "toml",
        "yaml", "markdown","rust"
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {}, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {} -- list of language that will be disabled
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            scope_incremental = "<CR>",
            node_incremental = "<TAB>",
            node_decremental = "<S-TAB>"
        }
    },
    -- indent = {enable = true},
    autopairs = {{enable = true}},
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["ib"] = "@block.inner",
                ["ab"] = "@block.outer",
                ["ir"] = "@parameter.inner",
                ["ar"] = "@parameter.outer"
            }
        }
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 2000,
        colors = {
          "#FFFFFF",
          "#FFCC55",
          "#AAAAFF",
          "#FF55FF",
          "#00FFFF",
          "#FFFF00",
          "#AAFF66",
        }
    }
}
