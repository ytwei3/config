return {
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    version = '*',
    cmd = { 'ToggleTerm' },
    keys = {
      { '<c-`>', '<cmd>ToggleTerm direction=float<cr>' },
      { '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>' },
    },
    opts = {
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,

      open_mapping = [[<c-\>]],

      -- start_in_inset = true,
      insert_mappings = true,
      terminal_mappings = true,
    },
  },
}
