vim.api.nvim_create_autocmd('BufEnter', {
  once = true,
  callback = function()
    vim.pack.add {
      'https://github.com/lewis6991/gitsigns.nvim',
      'https://github.com/nvim-tree/nvim-web-devicons',
      {
        src = 'https://github.com/romgrk/barbar.nvim',
        version = vim.version.range '1.x',
      },
    }
    vim.g.barbar_auto_setup = false
    -- require('barbar').setup()

    -- Define keymappings
    local keymappings = {
      -- Prev/next tabs
      { '<A-,>', '<Cmd>BufferPrevious<CR>', { desc = 'Barbar previous buffer' } },
      { '<A-.>', '<Cmd>BufferNext<CR>', { desc = 'Barbar next buffer' } },

      -- Reorders
      { '<A-<>', '<Cmd>BufferMovePrevious<CR>', { desc = 'Barbar move prev buffer' } },
      { '<A->>', '<Cmd>BufferMoveNext<CR>', { desc = 'Barbar move next buffer' } },

      -- Close
      { '<A-c>', '<Cmd>BufferClose<CR>', { desc = 'Barbar close buffer' } },
      { '<A-S-c>', '<Cmd>BufferRestore<CR>', { desc = 'Barbar restore last buffer' } },
      { '<A-b>', '<Cmd>BufferCloseAllButCurrent<CR>', { desc = 'Barbar close all buffers but current' } },
    }

    for _, mapping in pairs(keymappings) do
      vim.keymap.set('n', mapping[1], mapping[2], { desc = mapping[3].desc })
    end
  end,
})
