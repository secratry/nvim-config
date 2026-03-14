return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    "giuxtaposition/blink-cmp-copilot",
    'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },
    appearance = {
      kind_icons = {
        Copilot = " [AI]",
        Text = '󰉿 [Text]',
        Method = '󰊕 [Method]',
        Function = '󰊕 [Func]',
        Constructor = '󰒓 [Ctor]',
        Field = '󰜢 [Field]',
        Variable = '󰆦 [Var]',
        Property = '󰖷 [Prop]',
        Class = '󱡠 [Class]',
        Interface = '󱡠 [Iface]',
        Struct = '󱡠 [Struct]',
        Module = '󰅩 [Mod]',
        Unit = '󰪚 [Unit]',
        Value = '󰦨 [Val]',
        Enum = '󰦨 [Enum]',
        EnumMember = '󰦨 [Member]',
        Keyword = '󰻾 [Key]',
        Constant = '󰏿 [Const]',
        Snippet = '󱄽 [Snip]',
        Color = '󰏘 [Color]',
        File = '󰈔 [File]',
        Reference = '󰬲 [Ref]',
        Folder = '󰉋 [Dir]',
        Event = '󱐋 [Evt]',
        Operator = '󰪚 [Op]',
        TypeParameter = '󰬛 [Type]',
      },
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      documentation = { auto_show = false },
      menu = {
        auto_show = true,
      },
      ghost_text = {
        enabled = true,
      },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot'},
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 30,
          async = true,
          transform_items = function(_, items)
            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
            for _, item in ipairs(items) do
              item.kind = CompletionItemKind.Text -- force into "Text" category
              item.labelDetails = { description = "[Copilot]" } -- add label text
            end
            return items
          end,
        },
      },
    },
        -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
