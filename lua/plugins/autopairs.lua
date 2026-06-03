return {
  "windwp/nvim-autopairs",

  event = "InsertEnter",

  config = function()
    local npairs = require("nvim-autopairs")

    npairs.setup({
      check_ts = true, -- Enable treesitter integration for better behavior
      fast_wrap = {
        map = '<M-e>', -- Alt+e to fast wrap
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%)%>%]%)%}%,] ]], '%s+', ''),
        offset = 0,
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey = 'Comment'
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
    })

    -- blink.cmp integration is handled natively by blink.cmp
    -- No need to manually wire events; blink.cmp triggers confirm_done automatically
  end,
}
