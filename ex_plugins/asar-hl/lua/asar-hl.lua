local module = {}


local search_ancestors = require("lspconfig").util.search_ancestors

function module.setup(settings)
    if (settings.override_asm) then
        vim.filetype.add({
            extension = {
                asm = "asar",
                asar = "asar"
            }
        })
    else
        vim.filetype.add({
            extension = {
                asar = "asar",
                asm = function(path, _)
                    local found = search_ancestors(path, function(p)
                        local full = p .. "/.assembler"
                        local stat = vim.uv.fs_stat(full)
                        if (stat == nil) then
                            return false
                        else
                            return 0 ~= bit.band(stat.mode, 0x8000)
                        end
                    end)
                    if (found == nil) then return "asm" end
                    local fullpath = found .. "/.assembler"


                    local content = vim.system({ "cat", fullpath }):wait().stdout
                    if (content == nil) then return "asm" end

                    if vim.regex([[asar]]):match_str(content) then
                        return "asar"
                    else
                        return "asm"
                    end
                end
            }
        })
    end
end

return module
