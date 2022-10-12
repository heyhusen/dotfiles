local nvim_tree = require('nvim-tree')

nvim_tree.setup({
--  open_on_setup = false,
  ignore_ft_on_setup = {
    'startify',
    'dashboard',
    'alpha',
  },
})

