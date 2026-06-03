return {
  temperature = 0.1,
  context = "buffers",

  prompts = {
    -- C (42 School specific)
    CSafety = {
      prompt = "Audit this C code for undefined behavior, memory leaks, race conditions, and security flaws.",
    },
    COptimize = {
      prompt = "Optimize this C code for performance and memory layout on Linux x86_64.",
    },
    CRefactor = {
      prompt = "Refactor this C code to be minimal and idiomatic C.",
    },
    KernelStyle = {
      prompt = "Rewrite this C code following Linux kernel coding style.",
    },
    PushSwapAudit = {
      prompt = "Review this code under push_swap constraints defined in rules/norm.md, rules/memory.md, and rules/architecture.md. List violations clearly.",
    },
    PushSwapImprove = {
      prompt = "Improve this push_swap code while strictly respecting all rule files. Do not violate norm limits.",
    },
    NormCheck = {
      prompt = "Review this code under constraints defined in rules/norm.md. List violations clearly, and suggest improvements to meet the norm.",
    },

    -- Python
    PyRefactor = {
      prompt = "Refactor this Python code to be clean and Pythonic.",
    },
    PyOptimize = {
      prompt = "Optimize this Python code for performance and readability.",
    },
    PyTyping = {
      prompt = "Improve static typing and type hints.",
    },
    PyTests = {
      prompt = "Generate pytest unit tests including edge cases.",
    },

    -- General (more detailed versions)
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
}
