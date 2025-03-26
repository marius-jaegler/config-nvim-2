require("vim_settings")

local kb = require("keybinds")

kb.mapleader() -- must be set ONCE before keybinds
kb.independent()

require("setup_lazy")
require("plugin_setup.nvim_tree")
require("plugin_setup.autopairs")
require("plugin_setup.treesitter")
require("plugin_setup.autocomplete")
require("plugin_setup.telescope")
require("plugin_setup.gitsigns")


require("lsp_setup")


local whoiam = vim.system({ "whoami" }, {}):wait()
local me = vim.trim(whoiam.stdout or "NIL")

if vim.env.DISPLAY then
    if me == "root" then
        require("plugin_setup.theme.cp_root")
    else
        require("plugin_setup.theme.catppuccin")
    end
end


require("asar-hl").setup { override_asm = false }

-- alterative extension for vulkan shaders
vim.filetype.add({
    extension = {
        vert = "glsl",
        frag = "glsl"
    }
})


-- require("~/.config/nvim/ex_plugins/asar-hl").setup {override_asm = true}

local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)


vim.diagnostic.config{
  float={border=_border}
}
