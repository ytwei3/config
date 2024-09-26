return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      lazy = false,
      transparent_background = true,
    },
    init = function()
      vim.cmd.colorscheme 'catppuccin'
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'loctvl842/monokai-pro.nvim',

    -- priority = 1000, -- Make sure to load this before all the other start plugins.
    keys = { { '<leader>C', '<cmd>MonokaiProSelect<cr>', desc = 'Select Monokai pro filter' } },
    opts = {
      transparent_background = true, -- super buggy
      devicons = true,
      terminal_color = true,
      filter = 'pro',
      background_clear = {
        'float_win',
        'telescope',
        -- 'neo-tree',
        -- 'noice',
        'toggleterm',
      },
      plugins = {
        indent_blankline = {
          context_highlight = 'pro', -- default | pro
          context_start_underline = true,
        },
      },
    },
    -- config = function(opts)
    --   local monokai = require 'monokai-pro'
    --   monokai.setup(opts)
    --   monokai.load()
    -- end,
  },
}
