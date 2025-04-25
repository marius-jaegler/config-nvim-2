local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup {
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "async_path" },
    }, {
        { name = "buffer" }
    }),
    mapping = cmp.mapping.preset.insert(
        require("keybinds").completion(cmp, luasnip)
    ),
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    window = {
        completion = cmp.config.window.bordered({}),
        documentation = cmp.config.window.bordered({}),
    },
    formatting = {
        format = function(_, item)
            item.menu = ""
            return item
        end,
    },
}


cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    }
})
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" }
    }),
})

-- wtf is this for
vim.keymap.set("c", "<tab>", "<C-z>", { silent = false })
