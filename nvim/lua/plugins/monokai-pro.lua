return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'loctvl842/monokai-pro.nvim',
  lazy = false,
  priority = 1000, -- Make sure to load this before all the other start plugins.

  opts = {
    transparent_background = true,
    devicons = true,

    background_clear = { 'float_win' },
  },
  config = function(_, opts)
    local monokai = require 'monokai-pro'
    monokai.setup(opts)
    monokai.load()
  end,
}
