# Modern Neovim Configuration

A modernized, Lua-based Neovim configuration with LSP, Treesitter, and powerful plugins.

## Features

- ⚡ **Blazing fast startup** with lazy loading
- 🎨 **Modern UI** with statusline, icons, and smooth scrolling
- 🧠 **Native LSP** support for 10+ languages
- 🔍 **Powerful fuzzy finding** with Telescope
- 🌳 **Treesitter** for semantic syntax highlighting
- 📝 **Smart completion** with nvim-cmp
- 🎯 **Git integration** with Gitsigns and Fugitive
- 📁 **File explorer** with nvim-tree
- 🔧 **Easy plugin management** with lazy.nvim

## Quick Start

1. **Install Neovim** (0.9.0 or later)
   ```bash
   # macOS
   brew install neovim

   # Linux
   # See https://github.com/neovim/neovim/releases
   ```

2. **First Launch**
   ```bash
   nvim
   ```

   Plugins will auto-install on first startup. Wait for:
   - lazy.nvim to install plugins
   - Treesitter to compile parsers
   - Mason to install LSP servers

3. **Restart Neovim**

   After the initial installation, restart Neovim for everything to work properly.

## Documentation

- **[MIGRATION.md](MIGRATION.md)** - Complete guide to what changed from the old config
- **[KEYBINDINGS.md](KEYBINDINGS.md)** - Comprehensive keybinding reference
- **[CHEATSHEET.md](CHEATSHEET.md)** - Quick reference for essential shortcuts

## Essential Keybindings

Leader key: `,`

| Keys | Action |
|------|--------|
| `jk` | Exit insert mode |
| `,e` | Toggle file explorer |
| `,<space>` | Find git files |
| `,sg` | Live grep (search project) |
| `gd` | Go to definition |
| `K` | Show documentation |
| `,ca` | Code actions |

See [CHEATSHEET.md](CHEATSHEET.md) for more.

## Structure

```
.config/nvim/
├── init.lua              # Entry point
├── lua/
│   ├── config/
│   │   ├── options.lua   # Vim options
│   │   ├── keymaps.lua   # Keybindings
│   │   ├── autocmds.lua  # Autocommands
│   │   └── lazy.lua      # Plugin manager setup
│   └── plugins/          # Plugin configurations
│       ├── lsp.lua
│       ├── completion.lua
│       ├── telescope.lua
│       ├── file-explorer.lua
│       ├── git.lua
│       ├── treesitter.lua
│       ├── ui.lua
│       ├── editor.lua
│       └── colorscheme.lua
├── MIGRATION.md          # Migration guide
├── KEYBINDINGS.md        # Complete keybinding reference
├── CHEATSHEET.md         # Quick reference
└── README.md             # This file
```

## Plugin Highlights

### Core Functionality

- **lazy.nvim** - Modern plugin manager with lazy loading
- **nvim-lspconfig** - Native LSP configuration
- **nvim-cmp** - Completion engine
- **mason.nvim** - LSP/DAP/linter installer

### UI & Navigation

- **telescope.nvim** - Fuzzy finder for files, grep, and more
- **nvim-tree.lua** - File explorer
- **lualine.nvim** - Statusline
- **nvim-treesitter** - Syntax highlighting and code understanding
- **which-key.nvim** - Keybinding hints

### Git Integration

- **gitsigns.nvim** - Git change indicators
- **vim-fugitive** - Git commands
- **git-messenger.vim** - Show commit messages

### Editing

- **nvim-autopairs** - Auto-close brackets
- **vim-surround** - Manipulate surroundings
- **vim-commentary** - Comment toggling
- **todo-comments.nvim** - Highlight TODO/FIXME/etc.

### Language Support (via LSP)

- TypeScript/JavaScript
- Python
- Go
- Rust
- Lua
- HTML/CSS/JSON
- And many more...

## Customization

### Add a Plugin

Create a new file in `lua/plugins/`:

```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  config = function()
    require("plugin-name").setup({
      -- configuration here
    })
  end,
}
```

### Add Keybindings

Edit `lua/config/keymaps.lua`:

```lua
vim.keymap.set("n", "<leader>h", ":echo 'Hello'<CR>", { desc = "Say hello" })
```

### Change Colorscheme

Edit `lua/plugins/colorscheme.lua` and uncomment one of the alternatives, or add your own.

### Install LSP Servers

```
:Mason
```

Then press `i` on the package you want to install.

## Commands

| Command | Description |
|---------|-------------|
| `:Lazy` | Manage plugins |
| `:Mason` | Install LSP servers/tools |
| `:TSUpdate` | Update treesitter parsers |
| `:LspInfo` | Show LSP server info |
| `:checkhealth` | Check configuration health |
| `:Telescope keymaps` | Search all keybindings |

## Troubleshooting

### Plugins won't install
```
:Lazy sync
```

### LSP not working
```
:Mason
# Install the language server for your language
:LspRestart
```

### Treesitter errors
```
:TSUpdate
```

### Slow startup
```
:Lazy profile
# Shows load times for each plugin
```

### General issues
```
:checkhealth
# Comprehensive health check
```

## Requirements

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- ripgrep (for Telescope grep)
- A clipboard tool (xclip, xsel, or pbcopy/pbpaste)

Optional but recommended:
- Node.js (for some LSP servers)
- Python 3 (for some LSP servers)
- GCC or Clang (for Treesitter compilation)

## Philosophy

This configuration follows these principles:

1. **Native over plugin** - Use built-in Neovim features when possible
2. **Lua over VimScript** - Modern, fast, well-supported
3. **Lazy loading** - Fast startup times
4. **Modular** - Each plugin in its own file
5. **Well-documented** - Comments explain everything

## Updates

**Update all plugins:**
```
:Lazy update
```

**Update LSP servers:**
```
:Mason
# Press U to update all
```

**Update Treesitter parsers:**
```
:TSUpdate
```

## Credits

Original configuration preserved from legacy vim setup. Modernized with:
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- And many other amazing plugins!

## License

MIT

## Support

For issues with this config, check the documentation files:
- [MIGRATION.md](MIGRATION.md) - What changed
- [KEYBINDINGS.md](KEYBINDINGS.md) - All keybindings
- [CHEATSHEET.md](CHEATSHEET.md) - Quick reference

For Neovim help: `:help` or `:Telescope help_tags`
