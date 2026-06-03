# AGENTS.md - Neovim Configuration Guide

## Changes
Do not add, commit or push to git. 

## Launching
Run Neovim with this configuration using:
```bash
NVIM_APPNAME=nvim/nvim-my nvim
```

## Key Commands
- `:Lazy sync` - Update/install plugins
- `:Arborist` - View treesitter parser status
- `:ArboristInstall <lang>` - Install specific parser
- `,rf` - Format current file
- `,cc` - Compile C file
- `,cr` - Run C program
- `,pr` - Run Python file  
- `,pp` - Run pytest

## Treesitter
- Parsers auto-install when opening files
- WASM parsers preferred (faster, sandboxed)
- Run `:checkhealth arborist` if issues occur
- Textobjects: `af`/`if` (function), `ac`/`ic` (class)

## Structure
- `init.lua` - Main entry point
- `lua/core/` - Core configuration  
- `lua/plugins/` - Plugin configurations
- `lua/lsp/` - Language server configurations

## Python Specifics
- Uses 4-space indentation (overrides global 2-space)
- Sets completeopt for better completion
