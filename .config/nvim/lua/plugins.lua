vim.cmd "packadd paq-nvim"
local paq = require "paq-nvim".paq

paq {'savq/paq-nvim', opt=true}
paq {'nvim-treesitter/nvim-treesitter', run=vim.fn[':TSUpdate']}
paq 'Th3Whit3Wolf/one-nvim'
paq 'kyazdani42/nvim-web-devicons'
paq 'yamatsum/nvim-web-nonicons'
paq 'kyazdani42/nvim-tree.lua'
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'
paq 'akinsho/nvim-bufferline.lua'
-- paq {'glepnir/galaxyline.nvim', branch='main'}
paq 'editorconfig/editorconfig-vim' --vimscript
paq 'wfxr/minimap.vim' --vimscript
paq 'norcalli/nvim-colorizer.lua'
paq 'npxbr/glow.nvim'
paq 'f-person/git-blame.nvim'
paq 'b3nj5m1n/kommentary'

local plugin_path = vim.fn.stdpath("data") .. "/site/pack/paqs"
if vim.fn.empty(vim.fn.glob(plugin_path)) > 0 then
    vim.cmd[[ PaqInstall ]]
end

