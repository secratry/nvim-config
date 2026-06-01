return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    
    lint.linters_by_ft = {
      python = { "mypy" },
    }
    
    -- Configure mypy to avoid common issues
    lint.linters.mypy.args = {
      "--ignore-missing-imports",
      "--show-column-numbers", 
      "--show-error-end",
      "--no-error-summary",
    }
  end,
}
