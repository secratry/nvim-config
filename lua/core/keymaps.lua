local M = {}

-- ==========================================
-- Window Navigation (Ctrl + h/j/k/l)
-- ==========================================
-- Quick window switching without needing Ctrl+w prefix
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window", silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window", silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window", silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window", silent = true })

-- Also map for terminal mode to escape and navigate
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Move to left window from terminal", silent = true })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Move to lower window from terminal", silent = true })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Move to upper window from terminal", silent = true })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Move to right window from terminal", silent = true })

-- Easy window resizing with Alt + h/j/k/l
vim.keymap.set("n", "<M-h>", "<C-w><", { desc = "Decrease window width", silent = true })
vim.keymap.set("n", "<M-j>", "<C-w>-", { desc = "Decrease window height", silent = true })
vim.keymap.set("n", "<M-k>", "<C-w>+", { desc = "Increase window height", silent = true })
vim.keymap.set("n", "<M-l>", "<C-w>>", { desc = "Increase window width", silent = true })

function M.setup_whichkey()
  -- Which-key groups using v3 API
  local wk = require("which-key")

  wk.add({
    -- Groups (these get label from their children)
    { "<leader>c", group = "Code", icon = { icon = "󰅩", color = "blue" } },
    { "<leader>d", group = "Debug", icon = { icon = "󰃤", color = "red" } },
    { "<leader>e", group = "Explorer", icon = { icon = "󰏇", color = "purple" } },
    { "<leader>f", group = "Find", icon = { icon = "󰈞", color = "green" } },
    { "<leader>g", group = "Git", icon = { icon = "󰊢", color = "orange" } },
    { "<leader>l", group = "LSP", icon = { icon = "󰒕", color = "blue" } },
    { "<leader>p", group = "Python", icon = { icon = "󰌠", color = "yellow" } },
    { "<leader>r", group = "Run", icon = { icon = "󰜎", color = "green" } },
    { "<leader>s", group = "Search", icon = { icon = "󰍉", color = "cyan" } },
    { "<leader>t", group = "Test", icon = { icon = "󰙨", color = "magenta" } },
    { "<leader>u", group = "Toggle", icon = { icon = "󰔟", color = "yellow" } },
    { "<leader>x", group = "Trouble/Diagnostics", icon = { icon = "󰔫", color = "red" } },
  })
end

return M
