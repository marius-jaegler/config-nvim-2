
require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "python",
        "rust",
        "javascript",
        "typescript",
        "c",
        "lua",
        "vim";
        "vimdoc",
        "json",
        "query",
        "latex",
        "bash",
    },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        disable = {},

        additional_vim_regex_highlighting = true,
    }
}
