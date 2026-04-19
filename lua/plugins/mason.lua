return {
  {
    "mason-org/mason.nvim",
    priority = 1000,
    config = function()
      require("mason").setup()
    end,
  },

  -- 👇 ADD THIS BLOCK
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Python
          "ruff",
          "mypy",

          -- C / C++
          "clang-format",

          -- LSP (already handled, but safe)
          "clangd",

          -- Debuggers (optional but nice)
          "codelldb",
        },
        auto_update = false,
        run_on_start = true,
      })
    end,
  },
}
