return {
  { "mfussenegger/nvim-dap", config = function() require("tools.dap") end },
  { "mfussenegger/nvim-lint", config = function() require("tools.lint") end },
  { "stevearc/conform.nvim", config = function() require("tools.format") end },
}
