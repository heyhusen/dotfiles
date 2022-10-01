local fterm = require('FTerm')

local gitui = fterm:new({
    ft = 'fterm_gitui', -- You can also override the default filetype, if you want
    cmd = "gitui",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

function _G.__fterm_gitui() -- Use this to toggle gitui in a floating terminal
    gitui:toggle()
end

