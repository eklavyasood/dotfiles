return {
  "xiyaowong/transparent.nvim",
  config = function()
    vim.keymap.set('n', '<leader>tp', ':TransparentToggle<CR>')
  end
}
