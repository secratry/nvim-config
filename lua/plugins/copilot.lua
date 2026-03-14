return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = { enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<C-l>",
        next = "<C-j>",
        prev = "<C-k>",
        dismiss = "<C-h>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      cpp = true,
      c = true,
      h = true,
      python = true,
      lua = true,
      markdown = false,
      help = false,
      gitcommit = false,
      ["*"] = false,
    },
  },
}
