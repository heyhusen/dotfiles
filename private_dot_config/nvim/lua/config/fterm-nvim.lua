local term = require 'FTerm.terminal'

local gitui = term:new()

gitui:setup({
    cmd = "gitui",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

function _G.__fterm_gitui() -- Use this to toggle gitui in a floating terminal
    gitui:toggle()
end
