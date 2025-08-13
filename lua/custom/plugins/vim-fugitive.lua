return {
  'tpope/vim-fugitive',
  config = function()
    -- Global keymap to open fugitive
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })

    -- Autocommand to create keymaps only in fugitive buffers
    local fugitive_augroup = vim.api.nvim_create_augroup('FugitiveKeymaps', { clear = true })
    vim.api.nvim_create_autocmd('BufWinEnter', {
      group = fugitive_augroup,
      pattern = '*',
      callback = function()
        if vim.bo.ft ~= 'fugitive' then
          return
        end
        local bufnr = vim.api.nvim_get_current_buf()
        local push_opts = { buffer = bufnr, remap = false, silent = true, desc = '[P]ush to remote' }
        local pull_opts = { buffer = bufnr, remap = false, silent = true, desc = '[P]ull with rebase' }
        vim.keymap.set('n', '<leader>p', function()
          vim.cmd.Git 'push'
        end, push_opts)
        vim.keymap.set('n', '<leader>P', function()
          vim.cmd.Git { 'pull', '--rebase' }
        end, pull_opts)
      end,
    })
    vim.keymap.set('n', 'gu', '<cmd>diffget //2<CR>', { desc = 'Get diff from OURS' })
    vim.keymap.set('n', 'gh', '<cmd>diffget //3<CR>', { desc = 'Get diff from THEIRS' })
  end,
}
