
-- enable line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent=true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- should be auto-deteced
--vim.opt.termguicolors = true

vim.opt.scrolloff = 12
-- vim.opt.sidescrolloff = 0
vim.opt.signcolumn = "number" -- maybe set to "auto:1-9"
vim.opt.isfname:append("@-@") -- this is a whacky espace for literal '@'

vim.opt.updatetime = 100 -- in ms, not sure why it is decreased from 4000
-- vim.opt.colorcolumn = ''

