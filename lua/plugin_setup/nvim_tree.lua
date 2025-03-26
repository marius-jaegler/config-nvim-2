

local sort_lessthan = function(a, b)

    if a == nil or b == nil then
        vim.print("Fie sorter got a null node, change sort_lessthan to support this")
        return b ~= nil;
    end

    if a.type == nil or b.type == nil then
        return b.type ~= nil
    end

    local exta = a.extension or ''
    local extb = b.extension or ''

    if a.type == "directory" then
        if b.type == "directory" then
            return a.name < b.name
        else
            return true
        end
    elseif b.type == "directory" then
        return false
    elseif exta ~= extb then
        return exta < extb
    else
        return a.name < b.name
    end
end

require("nvim-web-devicons").setup {
    override = {
        asm = {
            icon = "A",
            color = "#EE2200",
            name = "Assembly"
        }
    }
}

require("nvim-tree").setup{
    sort = {sorter = function (nodes) table.sort(nodes, sort_lessthan) end},
    renderer = {
        icons = {
            git_placement = "right_align",
            glyphs = {
                git = {
                    unstaged = "M",
                    untracked = "N",
                    renamed = "➜",
                    staged = "S",
                }
            },
        }
    }
}
vim.cmd([[
    hi NvimTreeGitDirtyIcon guifg=#FF7F7F
    hi NvimTreeGitNewIcon guifg=#00FF00 
]])

-- disable netrw if everything went fine up to here
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

