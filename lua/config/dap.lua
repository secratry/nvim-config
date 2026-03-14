-- lua/config/dap.lua
local dap = require("dap")
local dapui = require("dapui")

-- Pretty breakpoint icons
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "▶", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "➤", texthl = "DiagnosticOk", linehl = "Visual", numhl = "" })

-- UI setup
dapui.setup({
  layouts = {
    {
      elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10,
      position = "bottom",
    },
  },
})

-- Auto-open/close UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Virtual text
require("nvim-dap-virtual-text").setup()

-- Mason DAP
require("mason-nvim-dap").setup({
  ensure_installed = { "codelldb", "cpptools" },
  automatic_installation = true,
})

-- C/C++ debugging (gdb)
dap.adapters.cpp = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap" },
}

dap.configurations.c = {
  {
    name = "Launch C program",
    type = "cpp",
    request = "launch",
    program = function()
      return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    args = function()
      local input = vim.fn.input("Arguments (space-separated): ")
      return vim.split(input, " ", { trimempty = true })
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

dap.configurations.cpp = dap.configurations.c


-- Debugging keymaps
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Condition: "))
end, { desc = "Conditional breakpoint" })

vim.keymap.set("n", "<leader>j", dap.continue, { desc = "Continue" })
vim.keymap.set("n", "<leader>k", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<leader>l", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<leader>h", dap.step_out, { desc = "Step out" })

vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run last debug session" })

vim.keymap.set("n", "<leader>dt", function()
  dapui.toggle()
end, { desc = "Toggle DAP UI" })

vim.keymap.set("n", "<leader>dx", function()
  dap.terminate()
  dapui.close()
end, { desc = "Terminate debug session" })

