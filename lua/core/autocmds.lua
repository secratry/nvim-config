-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function(args)
    require("conform").format({
      bufnr = args.buf,
      async = false,
      lsp_fallback = true,
    })
  end,
})

-- Lint after save 
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  callback = function()
    require("lint").try_lint()
  end,
})
