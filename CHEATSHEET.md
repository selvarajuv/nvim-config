# Neovim Cheatsheet

Your personal reference for your config at `~/.config/nvim`.
Leader key is `<Space>`. Most groups show up automatically via **which-key** — just press `<Space>` and wait.

---

## 1. Plugins at a glance

| Plugin | Purpose |
|---|---|
| **lazy.nvim** | Plugin manager. `:Lazy` opens the dashboard. |
| **catppuccin** | Colorscheme (mocha). |
| **telescope.nvim** + fzf-native | Fuzzy finder for files, grep, buffers, keymaps, commits, etc. |
| **oil.nvim** | File explorer that treats directories as editable buffers. Replaces netrw. |
| **barbar.nvim** | Buffer tab bar at the top. |
| **snacks.nvim** | Bag of utilities: indent guides, big-file handling, word highlighting, nicer `vim.ui.input`, lazygit, smart bufdelete. |
| **heirline.nvim** | Custom statusline (mode / filename / filetype / line:col). |
| **noice.nvim** + nvim-notify + nui | Pretty cmdline, messages, popups, notifications. |
| **mini.icons** | File-type icons (also shims `nvim-web-devicons`). |
| **modicator.nvim** | Colors the line number by current mode. |
| **vimade** | Dims inactive splits/windows. |
| **which-key.nvim** | Live popup of available keys after a prefix. |
| **nvim-treesitter** | Syntax-aware parsing for highlighting & indent. |
| **render-markdown.nvim** | Renders markdown nicely inside the buffer. |
| **nvim-lspconfig** + **mason** + **mason-lspconfig** | LSP servers (`pyright`, `ts_ls`, `lua_ls`) auto-installed and wired up. |
| **blink.cmp** | LSP-powered autocomplete. |
| **conform.nvim** | Format on save (ruff, prettier, stylua, gofmt, rustfmt). |
| **nvim-lint** | Async linting (ruff, eslint_d). |
| **trouble.nvim** | Diagnostics / quickfix / loclist panel. |
| **tiny-inline-diagnostic.nvim** | Inline diagnostic rendering (replaces default virtual text). |
| **nvim-lightbulb** | Shows 💡 when a code action is available. |
| **flash.nvim** | Jump anywhere on screen via 2-char label. |
| **nvim-autopairs** | Auto-close brackets/quotes. |
| **Comment.nvim** | `gc` / `gcc` commenting. |
| **nvim-surround** | Add/change/delete surrounding pairs. |
| **multicursors.nvim** | Multi-cursor editing (`<leader>m`). |
| **nvim-dap** + **dap-ui** + **mason-nvim-dap** | Debug Adapter Protocol, debugpy installed. |
| **neotest** + neotest-python | Run tests (pytest). |
| **nvim-coverage** | Coverage gutter signs. |
| **venv-selector.nvim** | Pick Python venv (incl. miniconda envs at `/opt/miniconda3`). |
| **git-conflict.nvim** | Visualize & resolve merge conflicts. |
| **git-blame.nvim** | Inline blame (off by default). |
| **comment-box.nvim** | Pretty ASCII comment boxes. |
| **nvim-chainsaw** | Insert/remove log statements. |
| **neogen** | Generate docstrings. |

---

## 2. Navigation

### Window / pane navigation (works across tmux too)
| Key | Action |
|---|---|
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Move between splits. Falls through to tmux panes at the edges. |
| `<C-w>s` / `<C-w>v` | Horizontal / vertical split. |
| `<C-w>q` | Close current split. |
| `<C-w>=` | Equalize splits. |
| `<C-w>o` | Close every split except this one. |

### Cursor movement
| Key | Action |
|---|---|
| `w` / `b` / `e` | Word forward / back / end-of-word. |
| `0` / `^` / `$` | Start of line / first non-blank / end of line. |
| `gg` / `G` | Top / bottom of file. |
| `{` / `}` | Previous / next paragraph. |
| `%` | Jump to matching bracket. |
| `<C-d>` / `<C-u>` | Half-page down/up — **stays centered** (custom). |
| `n` / `N` | Next/prev search match — **stays centered** (custom). |
| `<C-o>` / `<C-i>` | Jump back / forward in jumplist. |
| `''` | Back to last position. |
| `gd` / `gD` | Go to definition / declaration (LSP). |
| `gr` | Go to references (LSP). |

### Flash (fast on-screen jumps)
| Key | Action |
|---|---|
| `s` | Flash jump: type chars, then a label. |
| `S` | Flash by treesitter node. |
| `r` (operator) | Remote flash, e.g. `yr` to yank somewhere else. |
| `R` (operator/visual) | Treesitter search. |

---

## 3. Buffers

A *buffer* = an open file in memory. A *tab* in barbar represents a buffer.

| Key | Action |
|---|---|
| `<S-l>` | Next buffer (barbar). |
| `<S-h>` | Previous buffer (barbar). |
| `<leader>bd` | Delete current buffer (keeps split layout — via snacks). |
| `<leader>fb` | Telescope picker of open buffers. |
| `:b <name>` | Switch to buffer by name. |
| `:bd` | Delete buffer (raw vim). |
| `:e <path>` | Open a file as a new buffer. |
| `<C-^>` | Toggle between last two buffers. |

---

## 4. File explorer (oil.nvim)

Treats a directory as a normal buffer — edit it like text.

| Key | Action |
|---|---|
| `-` or `<leader>pv` | Open oil at the current file's directory. |
| `<CR>` | Open file / enter directory. |
| `-` (inside oil) | Go up a directory. |
| Type a new filename + `:w` | Create file. |
| `dd` + `:w` | Delete file/dir. |
| Edit line text + `:w` | Rename/move. |
| `g?` | Show oil help (all its keymaps). |

`<C-h/j/k/l>` are overridden inside oil to keep tmux-aware navigation.

---

## 5. Finding stuff (telescope)

All under `<leader>f` (which-key labels this as **find**).

| Key | Action |
|---|---|
| `<leader>ff` | Find files. |
| `<leader>fg` | Live grep across project. |
| `<leader>fs` | Grep word under cursor. |
| `<leader>fb` | Buffers. |
| `<leader>fr` | Recent files. |
| `<leader>fh` | Help tags. |
| `<leader>fk` | Keymaps (super useful — searchable list of *every* mapping). |
| `<leader>fc` | Commands. |
| `<leader>fd` | Diagnostics. |
| `<leader>fo` | Vim options. |

Inside a picker: `<C-h>` shows which-key for picker actions. Use `<C-n>/<C-p>` to move, `<CR>` to select, `<C-x>`/`<C-v>`/`<C-t>` to open in split/vsplit/tab.

---

## 6. Editing power tools

| Key | Action |
|---|---|
| `gcc` | Toggle comment on current line (Comment.nvim). |
| `gc` (visual) | Toggle comment on selection. |
| `gcap` | Comment a paragraph (`gc` + textobject). |
| `ysiw"` | Surround word with `"` (nvim-surround). |
| `cs"'` | Change surrounding `"` to `'`. |
| `ds"` | Delete surrounding `"`. |
| `S"` (visual) | Wrap selection in `"`. |
| `J` (visual) | Move selection down (custom). |
| `K` (visual) | Move selection up (custom). |
| `J` (normal) | Join lines without moving cursor (custom). |
| `=ap` | Re-indent paragraph in place (custom). |
| `<Esc>` | Clear search highlight (custom). |
| `<leader>m` | Start multi-cursor (multicursors.nvim). |

### Multicursors (after `<leader>m`)
- `n` add next match • `N` previous • `q` skip • `<Esc>` quit. The Hydra popup shows the rest.

---

## 7. LSP & code

| Key | Action |
|---|---|
| `K` | Hover docs. |
| `gd` | Go to definition. |
| `gD` | Go to declaration. |
| `gr` | References. |
| `gi` | Implementations. |
| `<C-]>` | Definition (alt). |
| `[d` / `]d` | Previous / next diagnostic. |
| `<leader>cf` | Format buffer (conform). |
| `<leader>cl` | Log variable under cursor (chainsaw). |
| `<leader>cR` | Remove all log statements. |
| `<leader>cn` | Generate docstring (neogen). |
| `<leader>cb` | Insert comment box. |

The `<leader>c` group is **code**. Code actions / rename use default vim.lsp.buf keymaps (`grn`, `gra` in Neovim 0.11+). nvim-lightbulb shows 💡 when an action is available.

### Completion (blink.cmp)
- `<C-Space>` open menu • `<Tab>`/`<S-Tab>` navigate • `<CR>` accept • `<C-e>` cancel.

---

## 8. Diagnostics & trouble

Inline diagnostics render via tiny-inline-diagnostic. Bigger view:

| Key | Action |
|---|---|
| `<leader>xx` | Toggle Trouble diagnostics (workspace). |
| `<leader>xX` | Buffer-only diagnostics. |
| `<leader>xq` | Quickfix list. |
| `<leader>xl` | Location list. |
| `<leader>fd` | Telescope diagnostics. |

---

## 9. Git

| Key | Action |
|---|---|
| `<leader>gg` | LazyGit floating window (snacks). |
| `<leader>gc` | Telescope git commits. |
| `<leader>gb` | Telescope git branches. |
| `<leader>gs` | Telescope git status. |
| `<leader>gB` | Toggle inline git blame. |

**git-conflict.nvim** auto-highlights conflict markers. Default mappings:
`co` ours, `ct` theirs, `cb` both, `c0` none, `]x`/`[x` next/prev conflict.

---

## 10. Testing & debug

### Tests (neotest)
| Key | Action |
|---|---|
| `<leader>tr` | Run nearest test. |
| `<leader>tf` | Run all tests in file. |
| `<leader>ts` | Toggle summary panel. |
| `<leader>to` | Open test output. |
| `<leader>tc` | Toggle coverage gutter signs. |

### Debugger (nvim-dap)
| Key | Action |
|---|---|
| `<F5>` | Continue / start. |
| `<F10>` | Step over. |
| `<F11>` | Step into. |
| `<F12>` | Step out. |
| `<leader>db` | Toggle breakpoint. |
| `<leader>dB` | Conditional breakpoint. |
| `<leader>du` | Toggle DAP UI. |

The DAP UI auto-opens when a session starts and closes when it ends.

---

## 11. Python

| Key | Action |
|---|---|
| `<leader>vs` | Pick a virtualenv (incl. `/opt/miniconda3/envs/*`). |

After selecting, pyright + ruff use it automatically.

---

## 12. Terminal

No in-editor terminal — use tmux panes/windows for shells. Use `:!cmd` for
quick one-shot commands. `<C-\><C-n>` still leaves terminal-insert mode in
any `:terminal` buffer you open manually.

---

## 13. Messages, notifications, help

| Key / Cmd | Action |
|---|---|
| `<leader>nh` | Noice message history. |
| `:Noice` | Noice main view. |
| `:checkhealth` | Diagnose plugin/runtime issues. |
| `:Lazy` | Plugin manager UI (`U` update, `S` sync, `?` help). |
| `:Mason` | LSP/linter/formatter/DAP installer UI. |
| `:LspInfo` | Active LSP clients on current buffer. |
| `:ConformInfo` | Formatter status for current buffer. |

---

## 14. Survival quick-reference (raw vim)

| Key | Action |
|---|---|
| `i` `a` `I` `A` `o` `O` | Insert before/after cursor / line start / line end / new line below / above. |
| `v` `V` `<C-v>` | Visual / linewise / blockwise. |
| `y` `d` `c` `p` `P` | Yank / delete / change / paste after / paste before. |
| `u` `<C-r>` | Undo / redo. |
| `.` | Repeat last change. |
| `*` `#` | Search word under cursor forward / back. |
| `/pat` `?pat` | Forward / backward search. |
| `:%s/foo/bar/g` | Replace globally in file (add `c` to confirm). |
| `q<letter>` ... `q` | Record macro; `@<letter>` to play. `@@` repeats last macro. |
| `gv` | Re-select last visual selection. |
| `<C-g>` | Show file path + position. |
| `ZZ` / `ZQ` | Save & quit / quit without save. |

Clipboard is set to `unnamedplus`, so `y` and `p` use the system clipboard.

---

## 15. Discovering more

- Forgot a key? Press the prefix (e.g. `<leader>`) and wait — **which-key** shows everything.
- Forgot a command? `<leader>fc` to fuzzy search all commands.
- Forgot a mapping? `<leader>fk` to fuzzy search all keymaps.
- Want to read a plugin's help? `<leader>fh` then type its name.
