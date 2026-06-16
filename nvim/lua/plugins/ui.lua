return {
  -- Monokai Pro colorscheme with transparent background
  {
    'loctvl842/monokai-pro.nvim',
    priority = 1000,
    opts = {
      transparent_background = true,
      terminal_colors = true,
      devicons = true,
      filter = 'pro', -- matches Ghostty Monokai Pro palette
      background_clear = {
        'float_win',
        'telescope',
        'which-key',
        'renamer',
        'notify',
        'neo-tree',
      },
    },
    init = function()
      vim.cmd.colorscheme 'monokai-pro'
    end,
  },

  -- Icons
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'auto',
        globalstatus = true,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },

  -- File explorer
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>e', '<Cmd>Neotree toggle<CR>', desc = 'File [E]xplorer' },
      { '\\', '<Cmd>Neotree reveal<CR>', desc = 'Reveal in explorer' },
    },
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = { enabled = true },
      },
      window = { position = 'right', width = 35 },
    },
  },

  -- Which-key for keymap hints
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      icons = { mappings = true },
      spec = {
        { '<leader>c', group = '[C]ode' },
        { '<leader>g', group = '[G]it' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
      },
    },
  },

  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      indent = { char = '│' },
      scope = { enabled = true },
    },
  },
}
