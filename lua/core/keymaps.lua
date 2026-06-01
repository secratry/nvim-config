vim.g.mapleader = ","

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =========================
-- General Editing
-- =========================

-- Move selected lines
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map('v', 'K', ":m '>-2<CR>gv=gv", { desc = "Move selection up" })

-- Change word (safer than double-space)
map('n', '<leader>w', 'ciw', { desc = "Change word" })

-- Search & replace word under cursor
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word globally" })

-- =========================
-- Move between splits
-- =========================

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up" })

-- =========================
-- AI (CopilotChat)
-- =========================

-- General
map("n", "<leader>ac", ":CopilotChat<CR>", { desc = "Open Copilot Chat" })
map("v", "<leader>ae", ":CopilotChat Explain<CR>", { desc = "Explain code (AI)" })
map("v", "<leader>at", ":CopilotChat Tests<CR>", { desc = "Generate tests (AI)" })

-- 42 Norm
map("v", "<leader>an", ":CopilotChat NormCheck<CR>", { desc = "42 Norm check (AI)" })

-- push_swap
map("v", "<leader>pa", ":CopilotChat PushSwapAudit<CR>", { desc = "Push_swap audit (AI)" })
map("v", "<leader>pi", ":CopilotChat PushSwapImprove<CR>", { desc = "Improve push_swap (AI)" })

-- C AI
map("v", "<leader>cs", ":CopilotChat CSafety<CR>", { desc = "C Safety audit (AI)" })
map("v", "<leader>co", ":CopilotChat COptimize<CR>", { desc = "Optimize C code (AI)" })
map("v", "<leader>ck", ":CopilotChat KernelStyle<CR>", { desc = "Linux kernel style (AI)" })

-- Python AI
map("v", "<leader>py", ":CopilotChat PyTyping<CR>", { desc = "Improve typing (AI)" })
map("v", "<leader>pf", ":CopilotChat PyRefactor<CR>", { desc = "Refactor Python (AI)" })


-- =========================
-- C Development (42 focused)
-- =========================

-- Compile
map("n", "<leader>cc", function()
  vim.cmd("w")
  vim.cmd("!cc -Wall -Wextra -Werror % -o %<")
end, { desc = "Compile C" })

-- Run
map("n", "<leader>cr", function()
  vim.cmd("!./%<")
end, { desc = "Run C program" })

-- Compile + Run (fast loop)
map("n", "<leader>cx", function()
  vim.cmd("w")
  vim.cmd("!cc -Wall -Wextra -Werror % -o %< && ./%<")
end, { desc = "Compile & run C" })

-- Valgrind
map("n", "<leader>cv", function()
  vim.cmd("!valgrind --leak-check=full ./%<")
end, { desc = "Run Valgrind" })


-- =========================
-- Python Development
-- =========================

-- Run file
map("n", "<leader>pr", function()
  vim.cmd("!python3 %")
end, { desc = "Run Python file" })

-- Run tests
map("n", "<leader>pp", function()
  vim.cmd("!pytest")
end, { desc = "Run pytest" })

-- =========================
-- FORMAT & RUFF (CLEAN)
-- =========================

-- Format
vim.keymap.set("n", "<leader>rf", function()
  require("conform").format({ async = true })
end, { desc = "Format file" })

-- Ruff safe fix
vim.keymap.set("n", "<leader>ra", function()
  vim.cmd("silent !ruff check --fix %")
  vim.cmd("checktime") -- Check if file changed, reload if needed
end)

-- Ruff unsafe fix
vim.keymap.set("n", "<leader>rA", function()
  vim.cmd("silent !ruff check --fix --unsafe-fixes %")
  vim.cmd("checktime") -- Check if file changed, reload if needed
end)

-- Lint
vim.keymap.set("n", "<leader>rl", function()
  require("lint").try_lint()
end)
