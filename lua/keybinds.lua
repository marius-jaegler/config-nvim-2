-- This module generates all the keybinds on demand
-- functions are called generally on init of plugins
return {
    --mapleader
    mapleader = function()
        vim.g.mapleader = " "
    end,


    independent = function()
        -- diagnostics
        vim.keymap.set("n", "vd", "<cmd>lua vim.diagnostic.open_float()<cr>")
        vim.keymap.set("n", "dn", "<cmd>lua vim.diagnostic.goto_next()<cr>")
        vim.keymap.set("n", "dN", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

        --tree keybinds
        vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>")

        vim.keymap.set("n", "nt", ":!alacritty &<CR><CR>")

        -- shift lines up/down, will be overwritten by cmp
        vim.keymap.set("n", "<C-j>", "ddp");
        vim.keymap.set("n", "<C-k>", "ddkP");

        vim.keymap.set("v", '<C-j>', "Dp`[v`]")
        vim.keymap.set("v", '<C-k>', "Dkkp`[v`]")
    end,

    telescope = function(tl)
        vim.keymap.set("n", "<leader>ff", tl.find_files)
        vim.keymap.set("n", "<leader>fg", tl.live_grep)
    end,

    with_lsp = function(opts)
        vim.keymap.set('n', 'K', "<cmd>lua vim.lsp.buf.hover()<cr>")
        vim.keymap.set('n', "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, 'fmt', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,

    completion = function(cmp, luasnip)
        return {
            -- request completions
            ['<C-Space>'] = cmp.mapping.complete(),

            -- cycle completions
            ['<C-j>'] = cmp.mapping(function(fb)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fb()
                end
            end, { "i", "c" }),
            ['<C-k>'] = cmp.mapping(function(fb)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fb()
                end
            end, { "i", "c" }),

            -- select completion
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<Tab>'] = cmp.mapping(function(fb)
                if cmp.visible() then
                    local entry = cmp.get_selected_entry()
                    if not entry then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    end
                    cmp.confirm()
                else
                    fb()
                end
            end, { "i", "s", "c" }),


            -- navigate snippets:
            ['<C-l>'] = cmp.mapping(function(fb)
                if luasnip.locally_jumpable(1) then
                    luasnip.jump(1)
                else
                    fb()
                end
            end),
            ['<C-h>'] = cmp.mapping(function(fb)
                if luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fb()
                end
            end),

        }
    end
}
