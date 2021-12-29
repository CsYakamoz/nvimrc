local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    matchup = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["i,"] = "@parameter.inner",
                ["a,"] = "@parameter.outer",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]z"] = "@parameter.inner",
            },
            goto_previous_start = {
                ["[z"] = "@parameter.inner",
            }
        }
    },
}
