-- config/treesitter.lua

require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "lua", "python", "bash", "json", "html", "css", "javascript", "markdown", "c", "cpp"

  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "python" },
  },
  incremental_selection = {
    enable = true,
  },
}

