local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("pyright", {
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
      },
    },
  },
})

vim.lsp.config("ruff", {
  capabilities = capabilities,
})
