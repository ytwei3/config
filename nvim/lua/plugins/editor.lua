return {
  -- Auto-detect indentation (tab vs space, width)
  { 'tpope/vim-sleuth' },

  -- Session persistence: restore files on reopen
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {},
    keys = {
      { '<leader>qs', function() require('persistence').load() end,               desc = '[S]ession restore' },
      { '<leader>ql', function() require('persistence').load { last = true } end, desc = '[S]ession restore last' },
      { '<leader>qd', function() require('persistence').stop() end,               desc = "[S]ession don't save" },
    },
  },

  -- Diagnostics / references panel
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    opts = { focus = true },
    keys = {
      { '<leader>xx', '<Cmd>Trouble diagnostics toggle<CR>',               desc = 'Diagnostics (all)' },
      { '<leader>xd', '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>',  desc = 'Diagnostics (buffer)' },
      { '<leader>xs', '<Cmd>Trouble symbols toggle<CR>',                   desc = 'Symbols' },
      { '<leader>xq', '<Cmd>Trouble qflist toggle<CR>',                    desc = 'Quickfix list' },
    },
  },

  -- Better text objects (va), ci", etc.)
  {
    'echasnovski/mini.ai',
    event = 'VeryLazy',
    opts = { n_lines = 500 },
  },

  -- Auto-close brackets/quotes
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function() return vim.fn.executable 'make' == 1 end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = { require('telescope.themes').get_dropdown() },
        },
      }
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local b = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sf', b.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sg', b.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sw', b.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sd', b.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', b.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>sh', b.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', b.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader><leader>', b.buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>/', function()
        b.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { previewer = false })
      end, { desc = 'Fuzzy search in buffer' })
    end,
  },

  -- Todo/note comments highlighting
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- Comment toggle: gcc / gc<motion>
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    opts = {},
  },

  -- Surround: ysiw" cs'" ds(
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    opts = {},
  },

  -- Flash motion: s to jump anywhere
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash jump' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash treesitter' },
      { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Flash remote' },
    },
  },

  -- Linting
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        python = { 'ruff' },
      }
      vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
        group = vim.api.nvim_create_augroup('user-lint', { clear = true }),
        callback = function() lint.try_lint() end,
      })
    end,
  },

  -- Formatting on save
  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = 'ConformInfo',
    keys = {
      { '<leader>cf', function() require('conform').format { async = true, lsp_format = 'fallback' } end, desc = '[C]ode [F]ormat' },
    },
    opts = {
      format_on_save = function(bufnr)
        local no_autoformat = { c = true, cpp = true }
        if no_autoformat[vim.bo[bufnr].filetype] then return end
        return { timeout_ms = 500, lsp_format = 'fallback' }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        go = { 'gofumpt' },
        rust = { 'rustfmt' },
      },
    },
  },
}
