-- config/treesitter.lua

require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "lua", "python", "bash", "json", "html", "css", "javascript", "markdown", "c", "cpp"

  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}

