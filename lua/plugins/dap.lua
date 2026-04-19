-- lua/plugins/dap.lua
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
      "williamboman/mason.nvim",
      "nvim-neotest/nvim-nio",   -- REQUIRED
    },
    config = function()
      require("tools.dap")
    end,
  },
}
