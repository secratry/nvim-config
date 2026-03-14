return {
  temperature = 0.1,
  context = "buffers",

  prompts = {

    -- C
    CSafety = "Audit this C code for undefined behavior, memory leaks, race conditions, and security flaws.",
    COptimize = "Optimize this C code for performance and memory layout on Linux x86_64.",
    CRefactor = "Refactor this C code to be minimal and idiomatic C.",
    KernelStyle = "Rewrite this C code following Linux kernel coding style.",
    PushSwapAudit = "Review this code under push_swap constraints defined in rules/norm.md, rules/memory.md, and rules/architecture.md. List violations clearly.",
    PushSwapImprove = "Improve this push_swap code while strictly respecting all rule files. Do not violate norm limits.",
    NormCheck = "Review this code under constraints defined in rules/norm.md. List violations clearly. and suggest improvements to meet the norm.",

    -- Python
    PyRefactor = "Refactor this Python code to be clean and Pythonic.",
    PyOptimize = "Optimize this Python code for performance and readability.",
    PyTyping = "Improve static typing and type hints.",
    PyTests = "Generate pytest unit tests including edge cases.",

    -- General
    Explain = "Explain this code deeply including edge cases.",
    Tests = "Generate thorough unit tests including edge cases.",
  },
}
