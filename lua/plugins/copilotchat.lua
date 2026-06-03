return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    event = "VeryLazy",
    opts = function()
      return require("core.copilotchat")
    end,
    keys = {
      {
        "<leader>cc",
        "<cmd>CopilotChat<cr>",
        desc = "CopilotChat - Chat",
      },
      {
        "<leader>cp",
        "<cmd>CopilotChatPrompt<cr>",
        desc = "CopilotChat - Prompt",
      },
    },
  },
}
