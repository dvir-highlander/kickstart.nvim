-- lua/custom/plugins/git-tools.lua
return {
  -- Lazygit integration
  {
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- NOTE: You must install the lazygit command-line tool.
    -- `brew install lazygit` or `scoop install lazygit`, etc.
  },

  -- GitHub Browse
  {
    'tpope/vim-rhubarb',
  },
}
