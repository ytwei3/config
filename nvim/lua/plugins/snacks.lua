return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          keys = {
            { icon = ' ', key = 'f', desc = 'Find File',       action = ':Telescope find_files' },
            { icon = ' ', key = 'n', desc = 'New File',        action = ':ene | startinsert' },
            { icon = ' ', key = 'g', desc = 'Live Grep',       action = ':Telescope live_grep' },
            { icon = ' ', key = 'r', desc = 'Recent Files',    action = ':Telescope oldfiles' },
            { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
            { icon = '󰒲 ', key = 'l', desc = 'Lazy',           action = ':Lazy' },
            { icon = ' ', key = 'q', desc = 'Quit',            action = ':qa' },
          },
        },
      },
      terminal  = { enabled = true },
      bigfile   = { enabled = true },
      bufdelete = { enabled = true },
      gitbrowse = { enabled = true },
      words     = { enabled = true },
      notifier  = { enabled = false },
      picker    = { enabled = false },
      indent    = { enabled = false },
    },
    keys = {
      { '<leader>tt', function() Snacks.terminal() end,   desc = '[T]erminal float', mode = { 'n', 't' } },
      { '<leader>gb', function() Snacks.gitbrowse() end,  desc = '[G]it [B]rowse in browser' },
      { '<leader>bd', function() Snacks.bufdelete() end,  desc = '[B]uffer [D]elete' },
    },
  },
}
