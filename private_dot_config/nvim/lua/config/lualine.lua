local lualine = require('lualine')

lualine.setup({
  sections = {
    lualine_b = {
      'branch',
      'diff',
      'lsp_progress',
      'diagnostics'
    },
  },
})

