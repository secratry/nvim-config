return {
  "arborist-ts/arborist.nvim",
  config = function()
    require("arborist").setup({
      update_cadence = "weekly",
      install_popular = true,
      ensure_installed = { "lua", "python", "bash", "json", "html", "css", "javascript", "markdown", "c", "cpp" },
    })
  end
}
