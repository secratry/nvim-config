local lint = require("lint")

-- Ruff (already good)
lint.linters.ruff = {
  cmd = "ruff",
  stdin = true,
  args = {
    "check",
    "--stdin-filename",
    function()
      return vim.api.nvim_buf_get_name(0)
    end,
    "-",
  },
}

-- ✅ FIXED MYPY (with parser)
lint.linters.mypy = {
  cmd = "mypy",
  stdin = false, -- IMPORTANT: mypy does NOT support stdin well
  args = {
    "--hide-error-context",
    "--no-color-output",
    "--no-error-summary",
    "--show-column-numbers",
    "--show-error-codes",
  },
  stream = "stdout",
  ignore_exitcode = true,

  parser = function(output, bufnr)
    local diagnostics = {}
    local filename = vim.api.nvim_buf_get_name(bufnr)

    for line in output:gmatch("[^\r\n]+") do
      -- format: file:line:col: message
      local lnum, col, msg = line:match("^.-:(%d+):(%d+): (.+)$")

      if lnum and col and msg then
        table.insert(diagnostics, {
          lnum = tonumber(lnum) - 1,
          col = tonumber(col) - 1,
          message = msg,
          severity = vim.diagnostic.severity.WARN,
          source = "mypy",
        })
      end
    end

    return diagnostics
  end,
}

lint.linters_by_ft = {
  python = { "ruff", "mypy" },
  c = { "clangtidy" },
  cpp = { "clangtidy" },
}
