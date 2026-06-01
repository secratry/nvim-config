-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function(args)
    local ok, conform = pcall(require, "conform")
    if ok then
      conform.format({
        bufnr = args.buf,
        async = false,
        lsp_fallback = true,
      })
    end
  end,
})

-- Lint after save 
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  callback = function()
    local ok, lint = pcall(require, "lint")
    if ok then
      lint.try_lint()
    end
  end,
})

-- Optional: live lint while typing (less aggressive)
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*.py",
  callback = function()
    local ok, lint = pcall(require, "lint")
    if ok then
      lint.try_lint()
    end
  end,
})
