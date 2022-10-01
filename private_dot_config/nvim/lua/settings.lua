local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

--------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------
opt.mouse	  = 'a'		-- Enable mouse support
opt.swapfile	  = false     	-- Don't use swapfile
opt.completeopt	  = 'menuone,noinsert,noselect'  -- Autocomplete options
opt.timeoutlen	  = 500

--------------------------------------------------------------------------
-- Appearance
--------------------------------------------------------------------------
opt.number	  = true	-- Enable line number
opt.colorcolumn	  = '80'	-- Line length marker at 80 columns
opt.linebreak	  = true	-- Wrap on word boundary
opt.smartcase	  = true	-- Ignore lowercase for the whole pattern
opt.ignorecase	  = true	-- Ignore case letters when search
opt.showmatch	  = true	-- Highlight matching parenthesis
opt.splitright	  = true	-- Vertical split to the right
opt.splitbelow	  = true	-- Horizontal split to the bottom
opt.termguicolors = true	-- Enable 24-bit RGB colors
opt.list	  = true

-------------------------------------------------------------------------
-- Tabs, indent
-------------------------------------------------------------------------
opt.shiftwidth	  = 2		-- Shift 4 spaces when tab
opt.softtabstop	  = 2           -- 1 tab == 4 spaces
opt.smartindent	  = true	-- Autoindent new lines

-------------------------------------------------------------------------
-- Memory, CPU
-------------------------------------------------------------------------
opt.hidden	  = true	-- Enable background buffers
opt.history	  = 100		-- Remember N lines in history
opt.lazyredraw	  = true	-- Faster scrolling
opt.synmaxcol	  = 240		-- Max column for syntax highlight
opt.updatetime	  = 700		-- ms to wait for trigger an event

-------------------------------------------------------------------------
-- Startup
-------------------------------------------------------------------------
-- Disable nvim intro
-- opt.shortmess:append "sI"

-- -- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end

