-- config/lazy.lua

-- Auto-install Lazy.nvim if not present
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    -- Import all plugins from lua/plugins
    { import = "plugins" },

    -- Extra standalone plugins
    { 'lewis6991/gitsigns.nvim' },
    { 'nvim-lualine/lualine.nvim' },
    { 'folke/which-key.nvim' },
  },
})

