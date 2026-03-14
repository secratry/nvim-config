return{
  "FtVim/norminette-lint.nvim",
  config = function()
    require("norminette-lint").setup({
      enable_on_start = false,  -- Default to false to improve startup performance
      keybinding = "<leader>nn", -- Default keybinding, you can define yours
    })
  end
}
