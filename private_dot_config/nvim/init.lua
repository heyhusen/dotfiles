-- paq.nvim automatic install
local install_path = vim.fn.stdpath("data") .. "/site/pack/paq/opt/paq-nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/savq/paq-nvim " .. install_path)
end


-- Disable default kommentary keybindings
vim.g.kommentary_create_default_mappings = false


-- Install plugins
require('plugins')


-- Settings
local cmd = vim.cmd
local indent = 4
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

cmd 'syntax enable'
cmd 'filetype plugin indent on'
opt('b', 'fileencoding', 'utf-8')
opt('o', 'fileencodings', 'utf-8')
opt('o', 'mouse', 'a')
opt('w', 'number', true)
opt('w', 'number', true)
opt('w', 'linebreak', true)
opt('o', 'showbreak', '+++')
opt('b', 'textwidth', 80)
opt('o', 'showmatch', true)
opt('o', 'visualbell', true)
opt('w', 'cursorline', true)
opt('o', 'hidden', true)
opt('o', 'hlsearch', true)
opt('o', 'smartcase', true)
opt('o', 'ignorecase', true)
opt('o', 'joinspaces', false)
opt('o', 'incsearch', true)
opt('b', 'autoindent', true)
opt('b', 'shiftwidth', indent)
opt('b', 'smartindent', true)
opt('o', 'smarttab', true)
opt('b', 'softtabstop', indent)
opt('o', 'ruler', true)
opt('b', 'textwidth', 80)
opt('w', 'colorcolumn', '+1')
opt('o', 'backup', false)
opt('o', 'writebackup', false)
opt('o', 'swapfile', false)
opt('o', 'cmdheight', 2)
opt('o', 'updatetime', 300)
opt('o', 'shortmess', 'c')
opt('o', 'undolevels', 1000)
opt('o', 'backspace', 'indent,eol,start')
opt('o', 'showmode', false)
opt('o', 'switchbuf', 'usetab,newtab')
opt('w', 'signcolumn', 'number')
opt('o', 'termguicolors', true)
cmd 'colorscheme nord'


-- Configs
require('config')


-- Key mappings
require('keymaps')
