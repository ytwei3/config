return {
  -- Gutter signs + hunk actions
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
      },
      on_attach = function(bufnr)
        local gs = require 'gitsigns'
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = 'Git: ' .. desc })
        end

        map('n', ']h', gs.next_hunk, 'Next hunk')
        map('n', '[h', gs.prev_hunk, 'Prev hunk')
        map('n', '<leader>gs', gs.stage_hunk, '[S]tage hunk')
        map('n', '<leader>gr', gs.reset_hunk, '[R]eset hunk')
        map('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, '[S]tage hunk')
        map('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, '[R]eset hunk')
        map('n', '<leader>gS', gs.stage_buffer, '[S]tage buffer')
        map('n', '<leader>gp', gs.preview_hunk, '[P]review hunk')
        map('n', '<leader>gb', gs.blame_line, '[B]lame line')
        map('n', '<leader>gd', gs.diffthis, '[D]iff index')
      end,
    },
  },

  -- LazyGit
  {
    'kdheepak/lazygit.nvim',
    cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitCurrentFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>gg', '<Cmd>LazyGit<CR>', desc = '[G]it UI (LazyGit)' },
    },
  },
}
