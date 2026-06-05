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
        local copilot = require("copilot")

        -- Check environment variable: default ON, set NVIM_COPILOT_INLINE=0 to disable
        local inline_enabled = vim.env.NVIM_COPILOT_INLINE ~= "0"

        copilot.setup({
          suggestion = {
            enabled = inline_enabled,
            auto_trigger = true,           -- Show suggestions automatically
            debounce = 75,                 -- Slight delay for performance
            hide_during_completion = true, -- Hide when completion menu is open
            keymap = {
              accept = "<C-l>",            -- Accept inline suggestion
              accept_word = false,
              accept_line = false,
              next = "<C-j>",              -- Next suggestion
              prev = "<C-k>",              -- Previous suggestion
              dismiss = "<C-e>",           -- Dismiss suggestion
            },
          },
          panel = { enabled = false },     -- Disable panel (use CopilotChat instead)
          filetypes = {
            markdown = true,
            help = false,
          },
        })

        -- Register toggle command (only affects current session)
        vim.api.nvim_create_user_command("CopilotInlineToggle", function()
          local suggestion = require("copilot.suggestion")
          local is_enabled = suggestion.is_visible() or suggestion.auto_trigger
          
          if is_enabled then
            -- Disable: close current + stop auto-trigger
            suggestion.dismiss()
            suggestion.auto_trigger = false
            vim.notify("Copilot inline: OFF (session)", vim.log.levels.INFO)
          else
            -- Enable: start auto-trigger
            suggestion.auto_trigger = true
            vim.notify("Copilot inline: ON (session)", vim.log.levels.INFO)
          end
        end, { desc = "Toggle Copilot inline suggestions for current session" })

        -- Notify initial state
        if not inline_enabled then
          vim.defer_fn(function()
            vim.notify("Copilot inline: OFF (NVIM_COPILOT_INLINE=0)", vim.log.levels.INFO)
          end, 1000)
        end
      end,
    },
  },
})
