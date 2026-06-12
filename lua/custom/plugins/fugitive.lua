vim.pack.add { 'https://github.com/tpope/vim-fugitive' }

vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
-- More can be set from https://github.com/ThePrimeagen/init.lua

local augroup_fugitive = vim.api.nvim_create_augroup('samjay-fugitive', {})

vim.api.nvim_create_autocmd('BufWinEnter', {
  group = augroup_fugitive,
  pattern = '*',
  callback = function()
    if vim.bo.ft ~= 'fugitive' then return end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { buffer = bufnr, remap = false }
    -- Push shortcut
    vim.keymap.set('n', '<leader>p', function()
      local merge_line = vim.api.nvim_buf_get_lines(bufnr, 1, 2, true)[1]
      local remote, branch = string.match(merge_line, '(%w+)/(%w+)', 8)
      local git_cmd = string.format('push -u %s %s', remote, branch)
      vim.cmd.Git(git_cmd)
    end, opts)

    -- Rebase shortcut
    vim.keymap.set('n', '<leader>P', function() vim.cmd.Git { 'pull', '--rebase' } end, opts)

    -- Tab should work as it does in Magit
    vim.keymap.set('n', '<Tab>', '=', { buffer = bufnr, remap = true })
  end,
})

vim.keymap.set('n', 'gu', '<cmd>diffget //2<CR>')
vim.keymap.set('n', 'gh', '<cmd>diffget //3<CR>')
