# Neovim Quick Reference Cheatsheet

Essential keybindings you should memorize for maximum productivity.

**Leader:** `,`

---

## 🚀 Most Important (Learn These First!)

```
jk          Exit insert mode (faster than ESC!)
,e          Toggle file explorer
,<space>    Find git files (most common file search)
,t          Find all files
,b          Find buffers
,sg         Live grep (search text in project)

gd          Go to definition (LSP)
K           Show documentation (LSP)
,ca         Code actions (LSP)
,rn         Rename symbol (LSP)
```

---

## 📁 File Navigation

```
,e          Toggle file explorer (nvim-tree)
,f          Find current file in explorer
C-\         Find current file in explorer

,<space>    Find files in git repo
,t          Find any file
,b          Switch between buffers
,sr         Recent files
C-e         Open last file
```

---

## 🔍 Search & Find (Telescope)

```
,<space>    Git files (fastest for most projects)
,t          All files
,b          Buffers
,sg         Live grep (search in all files)
,sw         Search word under cursor
,sh         Search help
,sk         Search keymaps
,ss         Document symbols (outline)
,st         Search TODOs
```

**In Telescope:**
```
C-j/C-k     Navigate results
C-q         Send to quickfix
Esc or q    Close
```

---

## 💻 LSP (Code Intelligence)

### Navigation
```
gd          Go to definition ⭐
gr          Find references ⭐
gi          Go to implementation
gt          Go to type definition
K           Hover docs ⭐
C-k         Signature help
```

### Actions
```
,ca         Code actions ⭐
,rn         Rename symbol ⭐
,fm         Format file
[d / ]d     Prev/next diagnostic
,d          Show diagnostic
```

---

## ✍️  Editing & Completion

```
Tab         Next completion / expand snippet
S-Tab       Previous completion
C-Space     Trigger completion
Enter       Accept completion
C-e         Abort completion

C-Space     Expand selection (treesitter)
Backspace   Shrink selection
```

---

## 🌳 Git (Gitsigns + Fugitive)

```
]c / [c     Next/prev git hunk
,hp         Preview hunk
,hs         Stage hunk
,hr         Reset hunk
,hb         Blame line
,tb         Toggle inline blame

,gs         Git status (fugitive)
,gd         Git diff
,gb         Git blame
\g          Toggle git signs
```

---

## 🪟 Windows & Buffers

```
C-h/j/k/l   Navigate splits ⭐
,z / ,x     Previous/next buffer
,b          Buffer picker

C-w v       Vertical split
C-w s       Horizontal split
C-w q       Close window
```

---

## 🎯 Text Objects (Treesitter)

```
vaf         Select around function
vif         Select inside function
vac         Select around class
vic         Select inside class

]f / [f     Next/prev function
]c / [c     Next/prev class
```

---

## 🔧 Toggles & Utilities

```
\l          Toggle line numbers
\p          Toggle paste mode
\q          Toggle quickfix list
\w          Toggle location list
\g          Toggle git signs
C-`         Toggle terminal
```

---

## 📋 Quickfix Lists

```
,cn / ,cp   Next/prev quickfix
,ln / ,lp   Next/prev location
C-q         Send telescope results to quickfix
```

---

## 💡 Tips & Tricks

### Essential Workflows

**Finding & Opening Files:**
```
,<space>    → type filename → Enter
```

**Searching Code:**
```
,sg         → type search term → Enter
```

**Code Navigation:**
```
gd          → jump to definition
gr          → see all usages
```

**Refactoring:**
```
,rn         → type new name → Enter
```

**Git Changes:**
```
]c          → jump to change
,hp         → preview what changed
,hs         → stage it
```

### Power User Combos

**Jump to symbol in file:**
```
,ss         → type symbol name → Enter
```

**Search & replace word:**
```
,sw         → select result → C-q → :cdo s/old/new/g
```

**Stage multiple hunks:**
```
]c,hs ]c,hs ]c,hs (repeat)
```

**Quick file switching:**
```
,b          → type buffer name → Enter
```

### Plugin Management

```
:Lazy       Plugin manager
:Mason      LSP installer
:TSUpdate   Update syntax parsers
:LspInfo    Check LSP status
```

---

## 🎓 Learning Path

### Week 1 - Basic Movement
- `jk` to exit insert mode
- `,e` for file explorer
- `,<space>` to find files
- `C-h/j/k/l` for split navigation

### Week 2 - LSP Basics
- `gd` to jump to definition
- `K` for documentation
- `Tab` for completion
- `[d` / `]d` for errors

### Week 3 - Search & Git
- `,sg` for project search
- `]c` / `[c` for git hunks
- `,hp` to preview changes
- `,gs` for git status

### Week 4 - Advanced
- `,ca` for code actions
- `,rn` for refactoring
- Text objects (`vif`, `vaf`)
- Treesitter navigation

---

## 🆘 Emergency Commands

```
:Lazy sync          Fix broken plugins
:LspRestart         Restart language server
:checkhealth        Diagnose issues
:messages           See error messages
:q!                 Quit without saving
:wq                 Save and quit
```

---

## 📖 More Help

- `:Telescope keymaps` - Search ALL keybindings
- Press any key and wait - which-key shows options
- `KEYBINDINGS.md` - Complete reference
- `MIGRATION.md` - What changed and why

**Pro tip:** Print this cheatsheet and keep it next to your keyboard for the first few weeks!
