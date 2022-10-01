-- Map leader to space
vim.g.mapleader = ' '

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Buffer
map('n', '<CA-k>', ':bnext<CR>')
map('n', '<CA-j>', ':bprevious<CR>')
map('n', '<CA-w>', ':bdelete<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-----------------------------------------------------------------------------
-- Plugins
-----------------------------------------------------------------------------

-- Packer
map('n', '<leader>u', '<cmd>lua require("packer").sync()<CR>')

-- NvimTree
map('n', '<leader>fe', ':NvimTreeFindFileToggle<CR>')	    -- Toggle
map('n', '<leader>fr', ':NvimTreeRefresh<CR>')		    -- Refresh

-- Telescope
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>')
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>')
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>')
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>')

-- Gitui
map('n', '<leader>g', '<CMD>lua __fterm_gitui()<CR>')

-- Trouble
map('n', '<leader>xx', '<cmd>TroubleToggle<CR>')
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<CR>')
map('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<CR>')
map('n', '<leader>xl', '<cmd>TroubleToggle loclist<CR>')
map('n', '<leader>xq', '<cmd>TroubleToggle quickfix<CR>')

