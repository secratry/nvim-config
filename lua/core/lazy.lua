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
    
    -- Treesitter configuration
    { import = "plugins.treesitter" },
    
    -- Extra standalone plugins
    { 'lewis6991/gitsigns.nvim' },
    { 'nvim-lualine/lualine.nvim' },
    { 
      'folke/which-key.nvim', 
      config = function() 
        vim.defer_fn(function() 
          require('core.keymaps').setup_whichkey() 
        end, 100) 
      end 
    },
    { 'folke/neoconf.nvim', cmd = 'Neoconf' },
    {
      'zbirenbaum/copilot.lua',
      config = function()
        require('copilot').setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
      end,
    },
  },
})
