return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff_format" },
        c = { "clang_format" },
        lua = { "stylua" },
      },
      format_on_save = false, -- We handle this in autocmds for more control
    })
  end,
}
