# Neovim Configuration Migration Guide

This document describes the modernization of your Neovim configuration from legacy VimScript to modern Lua-based configuration.

## Overview

Your Neovim configuration has been completely rewritten from VimScript to Lua, using modern plugins and best practices. The old configuration files have been preserved in case you need to reference them.

## Major Changes

### Configuration Structure

**Before:**
```
.config/nvim/
├── init.vim              # Main entry point (VimScript)
├── settings.vim          # Settings loader
└── settings/             # Individual setting files (VimScript)
```

**After:**
```
.config/nvim/
├── init.lua              # Main entry point (Lua)
└── lua/
    ├── config/
    │   ├── options.lua   # Core vim options
    │   ├── keymaps.lua   # Keybindings
    │   ├── autocmds.lua  # Autocommands
    │   └── lazy.lua      # Plugin manager config
    └── plugins/          # Individual plugin configs
        ├── lsp.lua
        ├── completion.lua
        ├── telescope.lua
        ├── file-explorer.lua
        ├── git.lua
        ├── treesitter.lua
        ├── ui.lua
        ├── editor.lua
        └── colorscheme.lua
```

### Plugin Manager

**Before:** vim-plug
**After:** lazy.nvim

lazy.nvim is the modern standard for Neovim plugin management. It provides:
- Lazy loading for faster startup
- Automatic plugin updates
- Better dependency management
- Clean UI for plugin management

**Commands:**
- `:Lazy` - Open plugin manager UI
- `:Lazy sync` - Install/update/clean plugins
- `:Lazy update` - Update plugins

## Plugin Replacements

### File Explorer

**Before:** NERDTree
**After:** nvim-tree.lua

**Why:** nvim-tree is written in Lua, making it faster and better integrated with Neovim. It has a cleaner codebase and better async support.

**Key differences:**
- Same keybindings maintained (`<leader>e`, `<leader>f`, `<C-\>`)
- Better git integration
- Faster performance
- Native Neovim integration

### Fuzzy Finder

**Before:** fzf.vim, ack.vim
**After:** telescope.nvim

**Why:** Telescope is the most powerful fuzzy finder for Neovim. It can search files, buffers, git files, live grep, LSP symbols, and much more.

**Key differences:**
- Same core keybindings maintained (`<leader><leader>`, `<leader>t`, `<leader>b`)
- Additional features: LSP integration, live grep, and more
- Better preview support
- Extensible with custom pickers

### Statusline

**Before:** vim-airline
**After:** lualine.nvim

**Why:** lualine is significantly faster (written in Lua), uses less memory, and has better integration with modern Neovim features.

**Key differences:**
- Cleaner, more performant
- Better LSP integration
- Global statusline (single line for all splits)

### Completion

**Before:** YouCompleteMe, coc.nvim, supertab
**After:** nvim-cmp + nvim-lspconfig

**Why:** Native LSP support is built into Neovim. nvim-cmp is the modern completion engine that integrates with it perfectly.

**Key differences:**
- Tab completion works the same way (like supertab)
- Better performance
- Native to Neovim
- More reliable
- Snippet support via LuaSnip

### Linting/Formatting

**Before:** syntastic, ALE
**After:** Native LSP + none-ls (null-ls)

**Why:** Neovim has built-in LSP support. none-ls bridges the gap for linters/formatters that don't have LSP servers.

**Key differences:**
- Diagnostics appear inline
- Better integration with language servers
- Automatic formatting on save (configurable)
- More reliable and performant

### Git Integration

**Before:** vim-gitgutter
**After:** gitsigns.nvim

**Why:** gitsigns is written in Lua, async by default, and much faster.

**Key differences:**
- Faster sign updates
- Better hunk preview
- Inline blame support
- Stage/unstage hunks directly in buffer

**Kept:** vim-fugitive (still the best git wrapper)

### Syntax Highlighting

**Before:** vim-javascript, vim-jsx, typescript-vim, vim-coffee-script, etc.
**After:** nvim-treesitter

**Why:** Treesitter provides semantic syntax highlighting based on a proper parse tree, not regex. It's faster, more accurate, and supports many languages.

**Key differences:**
- Better syntax highlighting
- Proper code understanding
- Text objects for functions, classes, etc.
- Consistent across all languages

### Color Highlighting

**Before:** vim-css-color
**After:** nvim-colorizer.lua

**Why:** Faster, written in Lua, better performance.

### Code Outline

**Before:** tagbar
**After:** nvim-treesitter-context + (optional) aerial.nvim

**Why:** Treesitter-based solutions understand code structure better.

## New Features

### Built-in LSP Support

Your configuration now has full LSP support for:
- TypeScript/JavaScript
- Python
- Go
- Rust
- Lua
- HTML/CSS/JSON
- And more...

**What this gives you:**
- Go to definition (`gd`)
- Find references (`gr`)
- Hover documentation (`K`)
- Code actions (`<leader>ca`)
- Rename (`<leader>rn`)
- Diagnostics (inline errors/warnings)

### Mason

Mason is a package manager for LSP servers, DAP servers, linters, and formatters. It makes installation trivial.

**Commands:**
- `:Mason` - Open installer UI
- `:MasonInstall <package>` - Install a package
- `:MasonUpdate` - Update all packages

### Treesitter Text Objects

You can now select/navigate by semantic units:

- `vaf` - Select around function
- `vif` - Select inside function
- `vac` - Select around class
- `vic` - Select inside class
- `]f` - Jump to next function
- `[f` - Jump to previous function

### Which-key

Press any key combination and wait - you'll see a popup showing what other keys are available. Great for discovering keybindings!

### Todo Comments

Comments with TODO, FIXME, HACK, etc. are now highlighted and searchable.

**Commands:**
- `]t` / `[t` - Jump to next/previous todo
- `<leader>st` - Search all todos with Telescope

### Better UI

- Dressing.nvim improves `vim.ui.select` and `vim.ui.input`
- Indent guides show indentation levels
- Smooth scrolling
- Word illumination (highlights word under cursor)

## First-time Setup

1. Start Neovim: `nvim`
2. Plugins will automatically install (via lazy.nvim)
3. Wait for treesitter parsers to install (`:TSUpdate`)
4. Wait for LSP servers to install (`:Mason`)
5. Restart Neovim

## Troubleshooting

### Plugins not installing

Run `:Lazy sync` manually.

### LSP servers not working

1. Check `:LspInfo` to see server status
2. Run `:Mason` to ensure servers are installed
3. Restart Neovim

### Treesitter errors

Run `:TSUpdate` to update parsers.

### Completions not working

Ensure you're in insert mode and start typing. Press `<C-Space>` to manually trigger completion.

## Configuration Philosophy

The new configuration follows these principles:

1. **Lua over VimScript:** Modern, faster, better tooling
2. **Native over plugin:** Use built-in features when possible
3. **Lazy loading:** Plugins load only when needed
4. **Modular:** Each plugin in its own file
5. **Well-documented:** Comments explain what everything does

## Customization

To add new plugins, create a new file in `lua/plugins/` and lazy.nvim will automatically load it.

Example (`lua/plugins/my-plugin.lua`):
```lua
return {
  "username/plugin-name",
  config = function()
    -- Plugin setup
  end,
}
```

## Performance

The new configuration should be noticeably faster:
- Lazy loading reduces startup time
- Lua plugins are faster than VimScript
- Native LSP is more efficient than YCM/CoC
- Treesitter is faster than regex-based syntax

## Keeping Up to Date

**Update plugins:**
```
:Lazy update
```

**Update LSP servers:**
```
:Mason
```
Then press `U` to update all.

**Update Treesitter parsers:**
```
:TSUpdate
```

## Getting Help

- `:help lazy.nvim` - Plugin manager help
- `:help lspconfig` - LSP configuration help
- `:help nvim-cmp` - Completion help
- `:help telescope.nvim` - Fuzzy finder help
- `:Telescope help_tags` - Search all help docs

## Rollback

If you need to rollback to the old configuration:

1. The old files are still in place (init.vim, settings/, etc.)
2. Rename `init.lua` to `init.lua.backup`
3. Neovim will fall back to `init.vim`

However, I recommend giving the new config a few days - it's significantly better!
