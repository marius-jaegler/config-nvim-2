local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- require all the plugins, configured later
require("lazy").setup {
    {
        "nvim-tree/nvim-tree.lua",
        name = "nvim-tree",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    "neovim/nvim-lspconfig",

    { dir = "~/.config/nvim/ex_plugins/asar-hl/", name = "asar-hl" },
    { "lewis6991/gitsigns.nvim",                  name = "gitsigns" },

    { -- autofetch lsps
        "williamboman/mason-lspconfig.nvim", dependencies = {
        "williamboman/mason.nvim",
    },
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
    },


    {
        "hrsh7th/nvim-cmp", dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "FelipeLema/cmp-async-path",
    },
    },

    --themes
    {
        "catppuccin/nvim", name = "catppuccin", priority = 1000,
    }
}
