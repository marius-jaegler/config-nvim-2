-- create LSP keybinds when a server is attached
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Lsp Actions",
    callback = function(event)
        local opts = { buffer = event.buf }
        require("keybinds").with_lsp(opts)
    end
})


-- utility function to use a server w/ default capabilities
local lsp_client_caps = require("cmp_nvim_lsp").default_capabilities()
local lsp_default = function(server)
    require("lspconfig")[server].setup {
        capabilities = lsp_client_caps
    }
end

-- auto install some LSPs
require("mason").setup()
require("mason-lspconfig").setup {
    handlers = { lsp_default }
}

-- attempt to spawn the servers to configure them
if pcall(vim.system, ({ "zls", "version" })) then
    lsp_default("zls")
end

if pcall(vim.system, ({ "ocamllsp", "--version" })) then
    lsp_default("ocamllsp")
end

vim.lsp.config('lua_ls', {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT',
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    '${3rd}/luv/library',
                    -- '${3rd}/busted/library'
                }
            }
        })
    end,
    settings = {
        Lua = {}
    }
})
