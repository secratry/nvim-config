return {
  "mason-org/mason.nvim",
  priority = 1000, -- load before mason-lspconfig
  config = function()
    require("mason").setup()
  end,
}

