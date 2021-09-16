require "paq" {
    "savq/paq-nvim";
    {"nvim-treesitter/nvim-treesitter", run=vim.fn[":TSUpdate"]};
    "kyazdani42/nvim-web-devicons";
    "yamatsum/nvim-web-nonicons";
    "arcticicestudio/nord-vim";
    "kyazdani42/nvim-tree.lua";
    "nvim-lua/popup.nvim";
    "nvim-lua/plenary.nvim";
    "nvim-telescope/telescope.nvim";
    "akinsho/nvim-bufferline.lua";
    {'glepnir/galaxyline.nvim', branch='main'};
    "editorconfig/editorconfig-vim"; --vimscript
    "wfxr/minimap.vim"; --vimscript
    "norcalli/nvim-colorizer.lua";
    "npxbr/glow.nvim";
    "f-person/git-blame.nvim";
    "numtostr/FTerm.nvim";
    "b3nj5m1n/kommentary";
    "glepnir/indent-guides.nvim";
}

local plugin_path = vim.fn.stdpath("data") .. "/site/pack/paqs"
if vim.fn.empty(vim.fn.glob(plugin_path)) > 0 then
    vim.cmd[[ PaqInstall ]]
end

