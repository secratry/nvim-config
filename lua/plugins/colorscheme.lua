return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true},
        specialReturn = true,
        specialException = true,
        transparent = false,
        dimInactive = false,
        globalStatus = true,
        colors = {
          palette = {
            -- Increase contrast:
            sumiInk0 = "#000000",
            sumiInk1 = "#0F0F14",
            fujiWhite = "#FFFFFF",
          },
        },
        overrides = function(colors)
          return {
            -- Customize for better debugging visibility
            DapBreakpoint = { fg = colors.palette.samuraiRed },
            DapStopped = { fg = colors.palette.springGreen },
          }
        end,
      })
      vim.cmd("colorscheme kanagawa")
    end,
  }
}