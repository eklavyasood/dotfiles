return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'open parent directory' }),
}
