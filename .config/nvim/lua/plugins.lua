vim.cmd "packadd paq-nvim"
local paq = require "paq-nvim".paq

paq{'savq/paq-nvim', opt=true}
paq{'nvim-treesitter/nvim-treesitter', run=vim.fn[':TSUpdate']}
paq 'glepnir/zephyr-nvim'
paq 'kyazdani42/nvim-web-devicons'
paq 'yamatsum/nvim-web-nonicons'
paq 'kyazdani42/nvim-tree.lua'
paq 'norcalli/nvim-colorizer.lua'

local plugin_path = vim.fn.stdpath("data") .. "/site/pack/paqs"
if vim.fn.empty(vim.fn.glob(plugin_path)) > 0 then
    vim.cmd[[ PaqInstall ]]
end
