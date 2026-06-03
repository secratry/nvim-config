vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.undofile = true
vim.diagnostic.config({
  virtual_text = true,   -- inline errors
  signs = true,          -- gutter icons
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.indentexpr = ""
    vim.bo.autoindent = true
    vim.bo.smartindent = true
    vim.bo.cindent = false
    -- prevent weird newline/comment continuation
    vim.opt_local.formatoptions:remove({ "o", "r" })
    -- prevent weird completion side effects
    vim.opt_local.completeopt = { "menu", "menuone", "noselect" }
  end,
})
