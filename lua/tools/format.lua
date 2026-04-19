require("conform").setup({
  formatters_by_ft = {
    python = { "ruff_format" },
    c = { "clang_format" },
    cpp = { "clang_format" },
  },

  formatters = {
    ruff_format = {
      command = "ruff",
      args = { "format", "--stdin-filename", "$FILENAME", "-" },
      stdin = true,
    },
  },
})
