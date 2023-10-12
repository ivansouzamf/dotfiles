return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- UI for lsp
    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

    -- Lua plugin for develop neovim stuff 
    'folke/neodev.nvim',
  },
}
