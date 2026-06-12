vim.schedule(function()
  vim.pack.add {
    'https://github.com/sindrets/diffview.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/NeogitOrg/neogit',
  }

  vim.keymap.set('n', '<leader>gs', '<cmd>Neogit<cr>', { desc = 'Show Neogit UI' })
end)
