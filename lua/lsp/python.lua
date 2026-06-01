-- Pyright (IDE features only, no type checking)
vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off", -- avoid conflict with mypy
        autoImportCompletions = true,
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})

-- Ruff LSP (lint + fixes)
vim.lsp.config("ruff", {
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  }
})

-- Enable servers
vim.lsp.enable("pyright")
vim.lsp.enable("ruff")
