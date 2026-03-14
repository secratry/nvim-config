vim.g.mapleader = ","
local keymap = vim.keymap

keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '>-2<CR>gv=gv")

keymap.set('n', '  ', "ciw")
keymap.set("n", " f", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General AI
map("v", "<leader>ae", ":CopilotChat Explain<CR>", opts)
map("v", "<leader>at", ":CopilotChat Tests<CR>", opts)

-- 42 Norm audit
map("v", "<leader>nn", ":CopilotChat NormCheck<CR>", opts)

-- push_swap audit
map("v", "<leader>pa", ":CopilotChat PushSwapAudit<CR>", opts)
map("v", "<leader>pi", ":CopilotChat PushSwapImprove<CR>", opts)

-- C specific
map("v", "<leader>cs", ":CopilotChat CSafety<CR>", opts)
map("v", "<leader>co", ":CopilotChat COptimize<CR>", opts)
map("v", "<leader>ck", ":CopilotChat KernelStyle<CR>", opts)

-- Python specific
map("v", "<leader>py", ":CopilotChat PyTyping<CR>", opts)
map("v", "<leader>pt", ":CopilotChat PyTests<CR>", opts)
map("v", "<leader>pr", ":CopilotChat PyRefactor<CR>", opts)

-- Open chat window
map("n", "<leader>ac", ":CopilotChat<CR>", opts)


