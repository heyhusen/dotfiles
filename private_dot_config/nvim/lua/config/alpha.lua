local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

local function footer()
  local total_plugins = #vim.tbl_keys(packer_plugins)
  local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
  local version = vim.version()
  local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

  return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
end

-- Set header
dashboard.section.header.val = {
    "",
    "",
    "     __                _           ",
    "  /\\ \\ \\___  _____   _(_)_ __ ___  ",
    " /  \\/ / _ \\/ _ \\ \\ / / | '_ ` _ \\ ",
    "/ /\\  /  __/ (_) \\ V /| | | | | | |",
    "\\_\\ \\/ \\___|\\___/ \\_/ |_|_| |_| |_|",
    "",
    "",
}

-- Set button
dashboard.section.buttons.val = {
  dashboard.button("<Leader>ff", "  Find File"),
  dashboard.button("<Leader>fe", "  File Explorer"),
  dashboard.button("<Leader>g", "  Git"),
  dashboard.button("<Leader>u", "  Update Plugins"),
  dashboard.button("<Leader>q", "  Quit")
}

-- Set footer
-- dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

