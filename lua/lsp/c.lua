-- clangd configuration using native Neovim LSP API (0.11+)
-- For hyperproductive C development

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--cross-file-rename",
    "--header-insertion=iwyu",
    "--pch-storage=memory",
    "--function-arg-placeholders",
  },
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  -- Additional hyperproductive settings
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
})

vim.lsp.enable("clangd")
