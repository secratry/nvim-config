-- Pyright (IDE features only, no type checking)
-- Hyperproductive settings for Python development
vim.lsp.config("pyright", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off", -- avoid conflict with mypy
        autoImportCompletions = true,
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        -- Hyperproductivity
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
        },
      },
    },
  },
})

-- Ruff LSP (lint + fixes)
vim.lsp.config("ruff", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
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
