-- Which-key groups
local wk = require("which-key")

wk.register({
  c = { name = "Code" },
  d = { name = "Debug" },
  e = { name = "Explorer" },
  f = { name = "File Tree" },
  g = { name = "Git" },
  l = { name = "LSP" },
  p = { name = "Python" },
  r = { name = "Run" },
  s = { name = "Search" },
  t = { name = "Test" },
  x = { name = "Trouble/Diagnostics" },
}, { prefix = "<leader>" })
