# Neovim Keybindings Reference

Complete reference for all keybindings in your modernized Neovim configuration.

**Leader key:** `,` (comma)

---

## General Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `jk` | Insert | `<Esc>` | Exit insert mode (faster than ESC) |
| `jk` | Command | `<C-c>` | Exit command mode |
| `j` | Normal | `gj` | Move down (respects wrapped lines) |
| `k` | Normal | `gk` | Move up (respects wrapped lines) |
| `0` | Normal | `^` | Go to first non-blank character |
| `^` | Normal | `0` | Go to start of line |
| `Y` | Normal | `y$` | Yank to end of line (consistent with D, C) |

## Window/Split Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-h>` | Normal | Move to left split | Navigate splits |
| `<C-j>` | Normal | Move to split below | Navigate splits |
| `<C-k>` | Normal | Move to split above | Navigate splits |
| `<C-l>` | Normal | Move to right split | Navigate splits |
| `<C-h/j/k/l>` | Terminal | Move to split | Same navigation from terminal mode |

## Buffer Management

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>z` | Normal | `:bprevious` | Go to previous buffer |
| `<leader>x` | Normal | `:bnext` | Go to next buffer |
| `<C-e>` | Normal | `:e#` | Open last/alternate file |
| `<leader>b` | Normal | Telescope buffers | Fuzzy find open buffers |

## File Explorer (nvim-tree)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>e` | Normal | Toggle file explorer | Open/close nvim-tree |
| `<leader>f` | Normal | Find current file | Reveal current file in tree |
| `<C-\>` | Normal | Find current file | Same as above |

**Within nvim-tree:**
- `a` - Create new file/folder
- `d` - Delete file/folder
- `r` - Rename file/folder
- `x` - Cut file/folder
- `c` - Copy file/folder
- `p` - Paste file/folder
- `<CR>` - Open file/folder
- `<C-v>` - Open in vertical split
- `<C-x>` - Open in horizontal split
- `<C-t>` - Open in new tab
- `R` - Refresh tree
- `H` - Toggle hidden files
- `g?` - Show help

## Fuzzy Finding (Telescope)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader><leader>` | Normal | Git files | Find files in git repo |
| `<leader>t` | Normal | Find files | Find all files |
| `<leader>b` | Normal | Find buffers | List open buffers |
| `<leader>sg` | Normal | Live grep | Search text in all files |
| `<leader>sw` | Normal | Grep word | Search word under cursor |
| `<leader>sh` | Normal | Help tags | Search help documentation |
| `<leader>sk` | Normal | Keymaps | Search all keybindings |
| `<leader>sc` | Normal | Commands | Search available commands |
| `<leader>sr` | Normal | Recent files | Recently opened files |
| `<leader>ss` | Normal | Document symbols | LSP symbols in current file |
| `<leader>sS` | Normal | Workspace symbols | LSP symbols in workspace |
| `<leader>st` | Normal | Todo comments | Search TODO/FIXME comments |

**Within Telescope:**
- `<C-j>` / `<C-k>` - Move selection up/down
- `<C-q>` - Send selected to quickfix list
- `<C-x>` - Delete buffer (in buffer picker)
- `<C-d>` - Delete buffer (alternative)
- `<Esc>` or `q` - Close telescope

## LSP (Language Server Protocol)

### Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gd` | Normal | Go to definition | Jump to where symbol is defined |
| `gD` | Normal | Go to declaration | Jump to declaration |
| `gi` | Normal | Go to implementation | Jump to implementation |
| `gr` | Normal | Go to references | Show all references |
| `gt` | Normal | Go to type definition | Jump to type definition |
| `K` | Normal | Hover documentation | Show documentation for symbol |
| `<C-k>` | Normal | Signature help | Show function signature |

### Code Actions

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>ca` | Normal | Code action | Show available code actions |
| `<leader>rn` | Normal | Rename symbol | Rename symbol under cursor |
| `<leader>fm` | Normal | Format code | Format current buffer |

### Diagnostics

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `[d` | Normal | Previous diagnostic | Jump to previous error/warning |
| `]d` | Normal | Next diagnostic | Jump to next error/warning |
| `<leader>d` | Normal | Show diagnostic | Show diagnostic in floating window |
| `<leader>q` | Normal | Diagnostic list | Add diagnostics to location list |

## Completion (nvim-cmp)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Tab>` | Insert | Next completion | Select next item (or expand snippet) |
| `<S-Tab>` | Insert | Previous completion | Select previous item (or jump back) |
| `<CR>` | Insert | Confirm | Accept selected completion |
| `<C-Space>` | Insert | Trigger completion | Manually trigger completion menu |
| `<C-e>` | Insert | Abort | Close completion menu |
| `<C-b>` | Insert | Scroll docs up | Scroll documentation up |
| `<C-f>` | Insert | Scroll docs down | Scroll documentation down |

## Git Integration

### Gitsigns (Hunk Management)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `]c` | Normal | Next hunk | Jump to next git change |
| `[c` | Normal | Previous hunk | Jump to previous git change |
| `<leader>hs` | Normal/Visual | Stage hunk | Stage current hunk |
| `<leader>hr` | Normal/Visual | Reset hunk | Discard current hunk |
| `<leader>hS` | Normal | Stage buffer | Stage entire buffer |
| `<leader>hR` | Normal | Reset buffer | Reset entire buffer |
| `<leader>hu` | Normal | Undo stage hunk | Undo staging |
| `<leader>hp` | Normal | Preview hunk | Show diff in floating window |
| `<leader>hb` | Normal | Blame line | Show git blame for line |
| `<leader>tb` | Normal | Toggle blame | Toggle inline blame |
| `<leader>hd` | Normal | Diff this | Show diff for file |
| `ih` | Operator/Visual | Select hunk | Text object for git hunk |
| `\g` | Normal | Toggle git signs | Show/hide git signs in gutter |

### Fugitive (Git Commands)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>gs` | Normal | Git status | Open git status window |
| `<leader>gd` | Normal | Git diff | Show git diff |
| `<leader>gb` | Normal | Git blame | Show git blame |
| `<leader>gm` | Normal | Git message | Show commit message for line |
| `<leader>dg` | Normal | Diff get | Get changes from other buffer |
| `<leader>dp` | Normal | Diff put | Put changes to other buffer |

## Quickfix & Location Lists

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>cn` | Normal | Next quickfix | Jump to next quickfix item |
| `<leader>cp` | Normal | Previous quickfix | Jump to previous quickfix item |
| `<leader>cc` | Normal | Current quickfix | Jump to current quickfix item |
| `<leader>ln` | Normal | Next location | Jump to next location list item |
| `<leader>lp` | Normal | Previous location | Jump to previous location list item |
| `<leader>ll` | Normal | Current location | Jump to current location list item |
| `\q` | Normal | Toggle quickfix | Open/close quickfix list |
| `\w` | Normal | Toggle location list | Open/close location list |

## Toggles

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `\l` | Normal | Toggle line numbers | Show/hide line numbers |
| `\p` | Normal | Toggle paste mode | Enable/disable paste mode |
| `\g` | Normal | Toggle git signs | Show/hide git gutter signs |
| `<C-`>` | Normal | Toggle terminal | Open/close terminal |

## Todo Comments

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `]t` | Normal | Next todo | Jump to next TODO/FIXME comment |
| `[t` | Normal | Previous todo | Jump to previous TODO/FIXME comment |
| `<leader>st` | Normal | Search todos | Search all todo comments |

## Treesitter Text Objects

### Selection

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-Space>` | Normal/Visual | Increment selection | Incrementally select larger syntax nodes |
| `<BS>` | Visual | Decrement selection | Shrink selection |
| `af` | Visual/Operator | Around function | Select around function |
| `if` | Visual/Operator | Inside function | Select inside function |
| `ac` | Visual/Operator | Around class | Select around class |
| `ic` | Visual/Operator | Inside class | Select inside class |
| `aa` | Visual/Operator | Around parameter | Select around parameter |
| `ia` | Visual/Operator | Inside parameter | Select inside parameter |

### Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `]f` | Normal | Next function start | Jump to next function |
| `[f` | Normal | Previous function start | Jump to previous function |
| `]F` | Normal | Next function end | Jump to next function end |
| `[F` | Normal | Previous function end | Jump to previous function end |
| `]c` | Normal | Next class start | Jump to next class |
| `[c` | Normal | Previous class start | Jump to previous class |

## Visual Mode

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<` | Visual | Outdent | Shift text left and stay in visual mode |
| `>` | Visual | Indent | Shift text right and stay in visual mode |

## Session Management

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>qs` | Normal | Restore session | Load saved session for current directory |
| `<leader>ql` | Normal | Restore last | Load last session |
| `<leader>qd` | Normal | Don't save | Stop session saving |

## Terminal Mode

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Esc>` | Terminal | Normal mode | Exit terminal mode to normal mode |
| `<C-h/j/k/l>` | Terminal | Navigate splits | Move between splits from terminal |
| `<C-`>` | Normal/Terminal | Toggle terminal | Open/close terminal |

## Plugin Management (lazy.nvim)

Run `:Lazy` to open the plugin manager, then:

- `I` - Install missing plugins
- `U` - Update plugins
- `C` - Clean unused plugins
- `S` - Sync (install, update, clean)
- `X` - Clear finished tasks
- `?` - Show help

## LSP Management (Mason)

Run `:Mason` to open the LSP installer, then:

- `i` - Install package under cursor
- `u` - Update package under cursor
- `U` - Update all packages
- `X` - Uninstall package
- `?` - Show help

## Other Useful Commands

| Command | Description |
|---------|-------------|
| `:Lazy` | Open plugin manager |
| `:Mason` | Open LSP/tool installer |
| `:TSUpdate` | Update treesitter parsers |
| `:LspInfo` | Show LSP client info |
| `:LspRestart` | Restart LSP server |
| `:NvimTreeToggle` | Toggle file tree |
| `:Telescope` | Open telescope picker |
| `:checkhealth` | Check Neovim health |

## Tips

1. **Discovery:** Press any partial key combination and wait - which-key will show you what's available!

2. **Help:** Use `:Telescope help_tags` to search all documentation

3. **Keymaps:** Use `:Telescope keymaps` to search all configured keybindings

4. **Custom keybindings:** Edit `lua/config/keymaps.lua` to add your own

5. **Plugin keybindings:** Each plugin config in `lua/plugins/` defines its own keybindings
