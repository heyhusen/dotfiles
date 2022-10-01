local bufferline = require('bufferline')

bufferline.setup{
  options = {
    separator_style = 'slant',
    offsets = {
      {
	filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
        text_align = 'left',
      },
    },
  },
}

