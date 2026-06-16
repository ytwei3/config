-- image filetype detection
vim.filetype.add {
  extension = {
    png = 'png',
    jpg = 'jpg',
    jpeg = 'jpeg',
    gif = 'gif',
    webp = 'webp',
  },
}

-- render images directly in buffer via image.nvim
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('user-image', { clear = true }),
  pattern = { 'png', 'jpg', 'jpeg', 'gif', 'webp' },
  callback = function(args)
    vim.bo[args.buf].modifiable = true
    vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, { '' })
    vim.bo[args.buf].modifiable = false
    vim.bo[args.buf].modified = false
    vim.schedule(function()
      local ok, image = pcall(require, 'image')
      if not ok then return end
      local img = image.from_file(vim.api.nvim_buf_get_name(args.buf), {
        buffer = args.buf,
        window = vim.api.nvim_get_current_win(),
      })
      if img then img:render() end
    end)
  end,
})

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('user-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- strip trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('user-trim', { clear = true }),
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd [[%s/\s\+$//e]]
    vim.api.nvim_win_set_cursor(0, pos)
  end,
})

-- resize splits when window is resized
vim.api.nvim_create_autocmd('VimResized', {
  group = vim.api.nvim_create_augroup('user-resize', { clear = true }),
  callback = function()
    vim.cmd 'tabdo wincmd ='
  end,
})
