local copilot_state = require("core.copilot_state")

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      debug = true,
      show_help = "yes",
      -- New prompts for Python and C
      prompts = {
        Explain = {
          prompt = "Please explain how this code works. Break down complex parts into simple steps and provide examples where helpful.",
        },
        Refactor = {
          prompt = "Please refactor this code to improve readability and maintainability while preserving all functionality. Add comments if necessary.",
        },
        Tests = {
          prompt = "Please generate comprehensive test cases for this code, including edge cases. Use pytest format for Python and Check framework for C.",
        },
        Fix = {
          prompt = "Please identify and fix any bugs or errors in this code. Explain what was wrong and how you fixed it.",
        },
        Optimize = {
          prompt = "Please optimize this code for better performance. Consider time complexity, memory usage, and algorithm efficiency.",
        },
        Docs = {
          prompt = "Please generate documentation for this code following Google-style docstrings for Python and Doxygen for C.",
        },
      },
    },
    build = function()
      vim.notify("Please update the remote plugins by running :UpdateRemotePlugins and restart Neovim.")
    end,
    event = "VeryLazy",
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
