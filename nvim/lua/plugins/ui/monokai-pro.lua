return {
  'loctvl842/monokai-pro.nvim',
  lazy = false,
  priority = 1000, -- Make sure to load this before all the other start plugins.

  opts = {
    transparent_background = true,
    terminal_color = true,
    devicons = true,

    background_clear = {
      'float_win',
      'telescope',
      'neo-tree',
      'notify',
    },
  },
  config = function(_, opts)
    local monokai = require 'monokai-pro'
    monokai.setup(opts)
    monokai.load()
  end,
}
