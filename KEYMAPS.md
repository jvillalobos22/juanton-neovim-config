# Neovim Keymap Cheatsheet

## Leader Key
- **Leader**: `<Space>`

## General

| Key | Action | Mode |
|-----|--------|------|
| `<Esc>` | Clear search highlights | Normal |
| `<leader>q` | Open diagnostic quickfix list | Normal |
| `<Esc><Esc>` | Exit terminal mode | Terminal |

## Window Navigation

| Key | Action | Mode |
|-----|--------|------|
| `<C-h>` | Move focus to left window | Normal |
| `<C-l>` | Move focus to right window | Normal |
| `<C-j>` | Move focus to lower window | Normal |
| `<C-k>` | Move focus to upper window | Normal |

## Tabs/Buffers

| Key | Action | Mode |
|-----|--------|------|
| `<Tab>` | Next buffer/tab | Normal |
| `<S-Tab>` | Previous buffer/tab | Normal |
| `:tabnew` | Open new tab | Command |
| `:tabedit <file>` | Open file in new tab | Command |
| `gt` | Go to next tab | Normal |
| `gT` | Go to previous tab | Normal |
| `<C-t>` (in Telescope) | Open file in new tab | Telescope |

## Telescope (Fuzzy Finder)

| Key | Action | Mode |
|-----|--------|------|
| `<leader>sh` | Search help | Normal |
| `<leader>sk` | Search keymaps | Normal |
| `<leader>sf` | Search files | Normal |
| `<leader>ss` | Search select Telescope | Normal |
| `<leader>sw` | Search current word | Normal |
| `<leader>sg` | Search by grep (live grep) | Normal |
| `<leader>sd` | Search diagnostics | Normal |
| `<leader>sr` | Search resume | Normal |
| `<leader>sp` | Search projects | Normal |
| `<leader>s.` | Search recent files | Normal |
| `<leader>sb` | Search file browser | Normal |
| `<leader><leader>` | Find existing buffers | Normal |
| `<leader>/` | Fuzzily search in current buffer | Normal |
| `<leader>s/` | Search in open files | Normal |
| `<leader>sn` | Search Neovim config files | Normal |
| `q` (in picker) | Close Telescope | Normal |

### Telescope File Browser (when open)

| Key | Action | Mode |
|-----|--------|------|
| `N` | Create new file/folder | Normal |
| `h` | Go to parent directory | Normal |
| `/` | Enter insert mode (search) | Normal |
| `<C-w>` | Delete word backward | Insert |

## LSP (Language Server Protocol)

| Key | Action | Mode |
|-----|--------|------|
| `K` | Hover documentation | Normal |
| `gd` | LSP Finder (find references/definitions) | Normal |
| `gp` | Peek definition | Normal |
| `gr` | Rename symbol | Normal |
| `grn` | Rename (Kickstart alternative) | Normal |
| `gra` | Code action | Normal |
| `grr` | Find references | Normal |
| `gri` | Go to implementation | Normal |
| `grd` | Go to definition (Kickstart) | Normal |
| `grD` | Go to declaration | Normal |
| `gO` | Document symbols | Normal |
| `gW` | Workspace symbols | Normal |
| `grt` | Type definition | Normal |
| `<leader>th` | Toggle inlay hints | Normal |
| `<leader>f` | Format buffer | Normal |

## Diagnostics

| Key | Action | Mode |
|-----|--------|------|
| `]d` | Next diagnostic | Normal |
| `[d` | Previous diagnostic | Normal |

## Completion (nvim-cmp)

| Key | Action | Mode |
|-----|--------|------|
| `<C-Space>` | Trigger completion | Insert |
| `<C-d>` | Scroll docs down | Insert |
| `<C-f>` | Scroll docs up | Insert |
| `<C-e>` | Close completion menu | Insert |
| `<CR>` | Confirm selection | Insert |
| `<C-s>` | Signature help | Insert |

## Project Management

| Key | Action | Mode |
|-----|--------|------|
| `<leader>sp` | Search/switch projects | Normal |

**Features:**
- Automatically detects project root (looks for `.git`, `package.json`, etc.)
- Auto-changes to project directory when opening files
- Telescope integration to search recent projects

## Git

| Key | Action | Mode |
|-----|--------|------|
| `<leader>h` | Git hunk operations (from gitsigns) | Normal/Visual |
| `<leader>gb` | Open git blame window | Normal |
| `<leader>go` | Open file/folder in git repository (browser) | Normal |

## Which-key Groups

| Key | Description |
|-----|-------------|
| `<leader>s` | Search operations |
| `<leader>t` | Toggle operations |
| `<leader>h` | Git hunk operations |

## Tab Management Commands

```vim
:tabnew [file]       " Open new tab with optional file
:tabedit [file]      " Edit file in new tab
:tabclose            " Close current tab
:tabonly             " Close all other tabs
:tabnext or gt       " Go to next tab
:tabprev or gT       " Go to previous tab
1gt, 2gt, 3gt        " Go to specific tab number
```

## Useful LSP Commands

```vim
:Mason               " Open Mason (LSP installer)
:LspInfo             " Show LSP client info
:Telescope lsp_*     " Various LSP-related Telescope pickers
```

## Useful Treesitter Commands

```vim
:TSUpdate            " Update all parsers
:TSInstall <lang>    " Install parser for language
:TSModuleInfo        " Show treesitter module info
```

## Linting & Formatting

**Linting (automatic via nvim-lint):**
- ESLint diagnostics via `eslint_d` (shows inline)
- Runs on: buffer enter, after save, leaving insert mode

**Formatting (via conform.nvim):**
- Prettier via `prettierd` (with `prettier` as fallback)
- Use `<leader>f` to format buffer
- Format on save enabled by default
- Supports: JS, JSX, TS, TSX, CSS, SCSS, LESS, JSON, HTML

# Neovim Shortcuts

## General Navigation & Window Management
- `Ctrl-w >` / `Ctrl-w <`: Expand/shrink window width.
- `:tabnew %`: Open the current file in a new tab.

## LSP (Language Server Protocol)
- `K`: Show documentation and type information for the symbol under the cursor (hover).
- `gd`: Jump to the definition of the symbol under the cursor.
- `<leader>gD`: (Custom) A potential custom keybinding to go to a definition in a new ta

## Telescope
- `:Telescope live_grep`: Search for a string in your project and see results live.
- `:Telescope grep_string`: Search for the word under your cursor in your project.



## Notes

- **`<C-x>`** means Ctrl + x
- **`<S-x>`** means Shift + x
- **`<leader>`** is mapped to Space
- Some keymaps only work when LSP is attached to a buffer
- Telescope keymaps use `<C-t>` to open results in new tab
- File browser opens in current file's directory with hidden files shown
- Git blame and browse require git.nvim plugin
- Mason auto-installs: `eslint_d`, `prettierd`, `prettier`, `stylua`
- Formatting uses `.prettierrc`, `.prettierrc.js`, or `prettier` config in package.json
