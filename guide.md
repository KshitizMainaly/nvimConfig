# Neovim Configuration Guide

## Config Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── core/
│   │   ├── options.lua         # Editor settings
│   │   ├── keymaps.lua         # Keybindings
│   │   └── lazy.lua            # Plugin manager bootstrap
│   └── plugins/
│       ├── aerial.lua          # Symbol outline sidebar
│       ├── autopairs.lua       # Auto-close brackets
│       ├── bufferline.lua      # Buffer tabs
│       ├── cmp.lua             # Autocompletion
│       ├── colorscheme.lua     # Catppuccin Mocha theme
│       ├── comment.lua         # Comment toggling
│       ├── dashboard.lua       # Start screen
│       ├── fidget.lua          # LSP progress indicators
│       ├── flash.lua           # Jump/search motions
│       ├── gitsigns.lua        # Git signs in gutter
│       ├── grug-far.lua        # Search & replace
│       ├── indent-blankline.lua # Indent guides
│       ├── lsp-signature.lua   # Function signature help
│       ├── lsp.lua             # Language servers (Mason)
│       ├── lualine.lua         # Statusline
│       ├── mini-indentscope.lua # Animated indent guides
│       ├── navic.lua           # Breadcrumbs in winbar
│       ├── neo-tree.lua        # File explorer sidebar
│       ├── neogit.lua          # Full git UI (Magit-style)
│       ├── neoscroll.lua       # Smooth scrolling
│       ├── scrollbar.lua       # Scrollbar with git/diagnostic marks
│       ├── smear-cursor.lua    # Smooth cursor animation
│       ├── surround.lua        # Surround text objects
│       ├── telescope.lua       # Fuzzy finder
│       ├── todo-comments.lua   # TODO/FIXME highlighting
│       ├── toggleterm.lua      # Terminal toggle
│       ├── treesitter.lua      # Syntax highlighting
│       ├── treesitter-textobjects.lua # Treesitter text objects
│       ├── trouble.lua         # Diagnostics list
│       ├── which-key.lua       # Keybinding hints
│       ├── avante.lua          # AI assistant (OpenRouter)
│       ├── dressing.nvim       # Enhanced UI for avante input
│       ├── image-preview.lua   # Image preview in WezTerm
│       └── smear-cursor.lua    # Smooth cursor animation
```

---

## Modes in Neovim

You are always in one mode. Check the bottom-left corner.

| Mode | What it does | How to enter |
|------|-------------|--------------|
| **NORMAL** | Navigate and run commands | `Esc` / `jk` / `jj` from insert |
| **INSERT** | Type text like a normal editor | `i` / `a` / `o` / `I` / `A` / `O` |
| **VISUAL** | Select text | `v` / `V` / `Ctrl+v` |
| **COMMAND** | Run ex commands | `:` |

---

## All Keybindings

Leader key = `Space`

### Essential (Core)

| Keybinding | Mode | Action |
|------------|------|--------|
| `jk` / `jj` / `kj` | INSERT | Exit to NORMAL mode |
| `i` / `a` / `o` | NORMAL | Enter INSERT mode |
| `I` / `A` / `O` | NORMAL | Insert at start/end of line / new line above |
| `u` | NORMAL | Undo |
| `Ctrl+r` | NORMAL | Redo |
| `.` | NORMAL | Repeat last action |
| `x` | NORMAL | Delete character under cursor |
| `dd` | NORMAL | Delete entire line |
| `yy` | NORMAL | Yank (copy) entire line |
| `p` / `P` | NORMAL | Paste below / above |

### Helix-Style Line Navigation

| Keybinding | Mode | Action |
|------------|------|--------|
| `gh` | NORMAL | Go to start of line (like `0`) |
| `gl` | NORMAL | Go to end of line (like `$`) |

### Leader Keybindings (Space)

Press `Space` and wait — which-key shows all available options.

| Keybinding | Action |
|------------|--------|
| `<Space>e` | Toggle file explorer (Neo-tree) |
| `<Space>f` | Find files (Telescope) |
| `<Space>g` | Group: Git |
| `<Space>gs` | Live grep / search text (Telescope) |
| `<Space>b` | List open buffers (Telescope) |
| `<Space>s` | Git status (Telescope) |
| `<Space>gg` | Open Neogit status |
| `<Space>gd` | Open Diffview (side-by-side diff) |
| `<Space>gh` | Open file git history (Diffview) |
| `<Space>sr` | Search & Replace (GrugFar - whole project) |
| `<Space>sR` | Search & Replace (current file / selection) |
| `<Space>st` | Search TODOs (Telescope) |
| `<Space>w` | Save file |
| `<Space>q` | Quit |
| `<Space>h` | Clear search highlight |
| `<Space>x` | Close current buffer |
| `<Space>o` | Toggle symbol outline (Aerial) |
| `<Space>O` | Toggle Aerial navigation window |
| `<Space>rn` | Rename symbol (LSP) |
| `<Space>ca` | Code action (LSP) |
| `<Space>D` | Type definition (LSP) |
| `<Space>ds` | Document symbols (LSP) |
| `<Space>gp` | Preview git hunk |
| `<Space>gb` | Blame line |
| `<Space>gr` | Reset git hunk |
| `<Space>xx` | Toggle diagnostics (Trouble) |
| `<Space>xX` | Buffer diagnostics (Trouble) |
| `<Space>cs` | Symbols (Trouble) |
| `<Space>cl` | LSP definitions/references (Trouble) |
| `<Space>xL` | Location list (Trouble) |
| `<Space>xQ` | Quickfix list (Trouble) |
| `<Space>xt` | Todo list (Trouble) |
| `<Space>xT` | Todo/Fix/Fixme list (Trouble) |

### LSP (Language Intelligence)

These work when a language server is active (shown in statusline).

| Keybinding | Action |
|------------|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Show references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<Space>rn` | Rename symbol |
| `<Space>ca` | Code action |
| `<Space>D` | Type definition |
| `<Space>ds` | Document symbols |

Installed servers: `lua_ls`, `ts_ls`, `pyright`, `html`, `cssls`, `jsonls`, `bashls`

### Flash (Jump/Search)

| Keybinding | Mode | Action |
|------------|------|--------|
| `s` | NORMAL/VISUAL | Flash jump (type label to jump) |
| `S` | NORMAL/VISUAL | Flash treesitter select |
| `r` | OPERATOR | Remote flash (jump while selecting) |
| `R` | OPERATOR/VISUAL | Treesitter search |
| `Ctrl+s` | COMMAND | Toggle flash search mode |

### Telescope (Fuzzy Finder)

| Keybinding | Action |
|------------|--------|
| `<Space>f` | Find files |
| `<Space>gs` | Live grep (search text) |
| `<Space>b` | List buffers |
| `<Space>s` | Git status |
| `<Space>st` | Search TODOs |

When Telescope is open:

| Keybinding | Action |
|------------|--------|
| `Ctrl+j/k` | Navigate results |
| `Enter` | Open selection |
| `Ctrl+v` | Open in vertical split |
| `Ctrl+x` | Open in horizontal split |
| `Tab` | Multi-select |
| `Ctrl+q` | Send all to quickfix |
| `Esc` | Close |

### Neo-tree (File Explorer)

| Keybinding | Action |
|------------|--------|
| `<Space>e` | Toggle sidebar |

Inside Neo-tree:

| Keybinding | Action |
|------------|--------|
| `Enter` | Open file |
| `a` | Add new file/folder |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `P` | Paste |
| `R` | Refresh |

### Neogit (Full Git UI)

| Keybinding | Action |
|------------|--------|
| `<Space>gg` | Open Neogit status |
| `<Space>gd` | Open Diffview (side-by-side diff) |
| `<Space>gh` | Open file git history |

Inside Neogit status buffer:

| Key | Action |
|-----|--------|
| `s` | Stage file/hunk |
| `u` | Unstage file/hunk |
| `S` | Stage all |
| `U` | Unstage all |
| `c` | Commit (opens commit message buffer) |
| `P` | Push |
| `p` | Pull |
| `r` | Rebase |
| `m` | Merge |
| `L` | Log |
| `q` | Close |
| `Tab` | Toggle diff preview |
| `-` | Toggle stage/unstage |

### Gitsigns (Git in Gutter)

| Keybinding | Action |
|------------|--------|
| `]h` | Next git hunk |
| `[h` | Previous git hunk |
| `<Space>gp` | Preview hunk |
| `<Space>gb` | Blame line |
| `<Space>gr` | Reset hunk |

### Aerial (Symbol Outline)

| Keybinding | Action |
|------------|--------|
| `<Space>o` | Toggle symbol outline sidebar |
| `<Space>O` | Toggle navigation window |

### Surround (nvim-surround)

| Keybinding | Mode | Action |
|------------|------|--------|
| `ys{motion}{char}` | NORMAL | Add surround (e.g., `ysiw"`) |
| `yss{char}` | NORMAL | Surround entire line |
| `ds{char}` | NORMAL | Delete surround (e.g., `ds"`) |
| `cs{old}{new}` | NORMAL | Change surround (e.g., `cs"'`) |
| `S{char}` | VISUAL | Surround selection |

### Comments

| Keybinding | Action |
|------------|--------|
| `gcc` | Toggle comment on current line |
| `gc` + motion | Toggle comment over motion (e.g., `gcap` = comment paragraph) |

### Completion (nvim-cmp)

When the completion popup appears:

| Keybinding | Action |
|------------|--------|
| `Tab` | Next item / expand snippet |
| `Shift+Tab` | Previous item |
| `Enter` | Confirm selection |
| `Ctrl+Space` | Trigger completion |
| `Ctrl+e` | Close completion |

### Todo Comments

| Keybinding | Action |
|------------|--------|
| `]t` | Next TODO/FIXME comment |
| `[t` | Previous TODO/FIXME comment |
| `<Space>st` | Search TODOs in Telescope |
| `<Space>xt` | Show TODOs in Trouble |

Supported keywords: `TODO`, `FIXME`, `BUG`, `HACK`, `WARN`, `NOTE`, `TEST`, `PERF`

### Trouble (Diagnostics List)

| Keybinding | Action |
|------------|--------|
| `<Space>xx` | Toggle diagnostics |
| `<Space>xX` | Buffer diagnostics only |
| `<Space>cs` | Document symbols |
| `<Space>cl` | LSP definitions/references |
| `<Space>xL` | Location list |
| `<Space>xQ` | Quickfix list |

### Navigation

| Keybinding | Action |
|------------|--------|
| `Ctrl+h/j/k/l` | Move between windows (splits) |
| `Shift+l` | Next buffer |
| `Shift+h` | Previous buffer |
| `Alt+1..5` | Jump to buffer 1-5 |

### Visual Mode

| Keybinding | Action |
|------------|--------|
| `<` / `>` | Indent / dedent (stays selected) |
| `v` | Character-wise visual select |
| `V` | Line-wise visual select |
| `Ctrl+v` | Block-wise visual select |

### Move Lines (Visual or Normal)

| Keybinding | Action |
|------------|--------|
| `Alt+j` | Move line/selection down |
| `Alt+k` | Move line/selection up |

### Terminal

| Keybinding | Action |
|------------|--------|
| `Ctrl+\` | Toggle floating terminal |
| `Esc` / `jk` | Exit terminal mode back to normal |

---

## Running Commands

**Type `:` to enter command mode**, then:

| Command | Action |
|---------|--------|
| `:w` | Save |
| `:q` | Quit |
| `:wq` | Save and quit |
| `:q!` | Quit without saving |
| `:x` | Save and quit |
| `:e filename` | Open a file |
| `:bd` | Close current buffer |
| `:!command` | Run shell command |
| `:checkhealth` | Run health checks |
| `:Lazy` | Open lazy.nvim plugin manager |
| `:Lazy sync` | Update all plugins |
| `:Lazy clean` | Remove unused plugins |
| `:Mason` | Open Mason (LSP server installer) |
| `:TSInstall lang` | Install treesitter parser |
| `:LspInfo` | Show attached LSP servers |
| `:GrugFar` | Open search & replace panel |
| `:AerialToggle` | Toggle symbol outline |
| `:Neogit` | Open Neogit status |
| `:TodoTelescope` | Search TODOs |
| `:TodoTrouble` | Show TODOs in Trouble |

---

## Installing More Treesitter Parsers

Run inside nvim:

```
:TSInstall javascript
:TSInstall typescript
:TSInstall tsx
:TSInstall html
:TSInstall css
:TSInstall json
:TSInstall python
:TSInstall bash
```

---

## Installing More LSP Servers

1. Open `:Mason`
2. Search for the server you want
3. Press `i` to install
4. It auto-attaches to matching filetypes

---

## Plugin Management

Open `:Lazy` to see all plugins. Inside:

| Key | Action |
|-----|--------|
| `I` | Install missing plugins |
| `U` | Update all plugins |
| `S` | Sync (install + clean) |
| `X` | Restore to lock file |
| `P` | Profile (startup time) |
| `L` | View log |

---

## Quick Workflows

### Git Workflow
1. `<Space>gg` — open Neogit
2. `s` — stage files
3. `c` — commit (type message, `Ctrl+w w` to switch to commit window, `:wq` to confirm)
4. `P` — push

### Search & Replace
1. `<Space>sr` — open GrugFar for whole project
2. Type search term, press `Enter`
3. Type replace term, press `<leader>r` to replace
4. `:wq` to apply changes

### Code Navigation
1. `gd` — go to definition
2. `gr` — find all references
3. `K` — hover for documentation
4. `<Space>rn` — rename symbol
5. `<Space>ca` — code actions

### File Navigation
1. `<Space>e` — toggle file tree
2. `<Space>f` — fuzzy find files
3. `<Space>gs` — grep/search text across project
4. `<Space>b` — switch between open buffers
5. `<Space>o` — symbol outline for current file

---

## Tips

1. **`jk` to exit insert mode** — faster than reaching for Esc
2. **Press Space and wait** — which-key shows you what's available
3. **`gd` is your best friend** — go to definition of anything
4. **`<Space>f` to find files** — no more `:e filename`
5. **`<Space>gs` to search text** — grep across your whole project
6. **`gcc` to comment/uncomment** — works on single line or visual selection
7. **`K` on any symbol** — instant documentation
8. **`<Space>e`** — toggle file tree to navigate project structure
9. **`s` for flash jump** — instant jump to any visible location
10. **`<Space>gg` for full git UI** — stage, commit, push without leaving nvim
