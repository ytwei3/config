return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require('nvim-treesitter').setup {
        ensure_installed = {
          'bash', 'c', 'cpp', 'cmake',
          'go', 'gomod', 'gosum',
          'python',
          'rust', 'toml',
          'lua', 'luadoc',
          'markdown', 'markdown_inline',
          'vim', 'vimdoc', 'query',
          'json', 'yaml',
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
}
