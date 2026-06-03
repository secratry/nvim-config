local M = {}

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
