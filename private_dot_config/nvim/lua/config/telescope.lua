local telescope = require('telescope')
local telescope_themes = require('telescope.themes')

telescope.setup({
  extensions = {
    ['ui-select'] = {
      telescope_themes.get_dropdown()
    }
  }
})

telescope.load_extension('ui-select')
