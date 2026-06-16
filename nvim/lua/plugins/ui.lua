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

  -- Buffer tabs at the top
  {
    'akinsho/bufferline.nvim',
    version = '*',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Prev buffer' },
      { '<S-l>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
      { '<leader>x', '<Cmd>bdelete<CR>', desc = 'Close buffer' },
    },
    opts = {
      options = {
        diagnostics = 'nvim_lsp',
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = 'thin',
        offsets = {
          { filetype = 'neo-tree', text = 'Explorer', highlight = 'Directory', text_align = 'left' },
        },
      },
    },
  },

  -- Noice: floating cmdline / search / notifications
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      { 'rcarriga/nvim-notify', opts = { render = 'compact', timeout = 3000 } },
    },
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },

  -- Image rendering in buffer (requires Ghostty / Kitty)
  {
    '3rd/image.nvim',
    ft = { 'markdown', 'png', 'jpg', 'jpeg', 'gif', 'webp', 'svg' },
    opts = {
      backend = 'kitty',
      integrations = {
        markdown = {
          enabled = true,
          download_remote_images = false,
        },
      },
      max_width_window_percentage = 100,
      max_height_window_percentage = 90,
    },
  },

  -- Markdown browser preview
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' },
    ft = { 'markdown' },
    build = function() vim.fn['mkdp#util#install']() end,
    keys = {
      { '<leader>mp', '<Cmd>MarkdownPreviewToggle<CR>', desc = '[M]arkdown [P]review' },
    },
  },

  -- Markdown in-buffer rendering
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ft = { 'markdown' },
    opts = {
      heading = { enabled = true },
      checkbox = { enabled = true },
      bullet = { enabled = true },
      code = { enabled = true, style = 'full' },
      dash = { enabled = true },
      table = { enabled = true },
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
