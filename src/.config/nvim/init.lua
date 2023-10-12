-- Set <space> as the leader key
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Plugins setup
require('lazy').setup({
  -- Useful plugin to show you pending keybinds
  -- { 'folke/which-key.nvim', opts = {} },
  -- Configure tabs automatically
  'tpope/vim-sleuth',
  -- Move code
  'fedepujol/move.nvim',
  -- Autopairs for brackets
  require("plugins/autopairs"),
  -- Lsp
  require("plugins/lsp"),
  -- Autocompletion
  require("plugins/cmp"),
  -- Setup neovim themes
  require("plugins/themes"),
  -- Statusline 
  require("plugins/statusline"),
  -- Add indentation guides even on blank lines
  require("plugins/indent-blankline"),
  -- Autocomment 
  require("plugins/comment"),
  -- Fuzzy Finder (files, lsp, etc)
  require("plugins/telescope"),
  -- Syntax highlight, edit, and navigate code
  require("plugins/treesitter"),
}, {})


-- [[ Setting options ]]

-- Set highlight on search
vim.o.hlsearch = false
-- Make line numbers default
vim.wo.number = true
-- Enable mouse mode
vim.o.mouse = 'a'
-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
-- NOTE: Could have problems in some terminals 
vim.o.termguicolors = true


-- [[ Basic Keymaps ]]

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
-- Keymaps for better default experience
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- Undo/Redo
keymap('n', '<C-u>', 'u', {})
-- keymap('n', '<C-r>', 'redo', {})
-- Move code
keymap('n', '<A-Up>', ':MoveLine(-1)<CR>', opts)
keymap('n', '<A-Down>', ':MoveLine(1)<CR>', opts)
-- Move blocks of code when in visual mode
keymap('v', '<A-Up>', ':MoveBlock(-1)<CR>', opts)
keymap('v', '<A-Down>', ':MoveBlock(1)<CR>', opts)


-- [[ Highlight on yank ]]

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- [[ Configure Telescope ]]
require("configs/telescope")
-- [[ Configure Treesitter ]]
require("configs/treesitter")
-- [[ Configure LSP ]]
require("configs/lsp")
-- [[ Configure nvim-cmp ]]
require("configs/cmp")
