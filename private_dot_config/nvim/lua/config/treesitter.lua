local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = { 
    "bash",
    "css",
    "dockerfile",
    "fish",
    "gitattributes",
    "gitignore",
    "go",
    "gomod",
    "gowork",
    "graphql",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "lua",
    "markdown",
    "proto",
    "python",
    "rust",
    "scss",
    "sql",
    "svelte",
    "toml",
    "tsx",
    "typescript",
    "vue",
    "yaml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
}
