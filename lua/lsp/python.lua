-- Pyright (IDE features only, no type checking)
vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off", -- avoid conflict with mypy
        autoImportCompletions = true,
      },
    },
  },
})

-- Ruff (lint + fixes)
vim.lsp.config("ruff", {})

-- Enable servers
vim.lsp.enable("pyright")
vim.lsp.enable("ruff")
