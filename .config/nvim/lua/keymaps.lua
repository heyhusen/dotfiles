local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader to space
vim.g.mapleader = ' '

-- nvim-tree
map('n', '<C-b>', ':NvimTreeToggle<CR>')

-- telescope.nvim
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope git_files<cr>')
map('n', '<leader>fl', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
map('n', '<C-p>', '<cmd>Telescope git_files<cr>')

-- nvim-bufferline
map('n', '<silent>[b', ':BufferLineCycleNext<CR>')
map('n', '<silent>b]', ':BufferLineCyclePrev<CR>')

-- glow-nvim
map('n', '<leader>p', ':Glow<CR>')
