-- Format on save
vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "TextChangedI" }, {
  callback = function(args)
    require("conform").format({
      bufnr = args.buf,
      async = false,
      lsp_fallback = true,
    })
  end,
})

-- Lint after save / leaving insert
vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
