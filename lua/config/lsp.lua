-- config/lsp.lua

local lspconfig = require("mason-lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local cmp_nvim_lsp = require("blink.cmp")

-- Diagnostic display settings
vim.diagnostic.config({
  virtual_text = { prefix = "●", spacing = 2 },
  signs = true,
  underline = true,
  update_in_insert = false, -- don't update while typing
  severity_sort = true,     -- sort diagnostics by severity
})

-- Signs in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "󰌵", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Enhance capabilities for nvim-cmp
local capabilities = cmp_nvim_lsp.get_lsp_capabilities()

local servers = { "lua_ls", "pyright", "clangd" }

-- List of serverst to setup
mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
  automatic_enable = true,  -- New API; auto-enables installed servers
})

-- Default server config for all servers
vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    -- LSP keymaps
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local keymap = vim.keymap.set

    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "gi", vim.lsp.buf.implementation, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    keymap("n", "[d", vim.diagnostic.goto_prev, opts)
    keymap("n", "]d", vim.diagnostic.goto_next, opts)
  end,
})

-- Setup Mason LSP and insure servers are installed
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})
