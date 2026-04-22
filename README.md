# Neovim Configuration

Minimal [Neovim] setup powered by [vim.pack], the [ferric.nvim] colorscheme,
and a single plugin file: [`plugins.lua`]. The goal is a fast, cohesive editing
experience with sensible defaults for Rust, C/C++, Lua, and common file formats.

<details>
  <summary>📸 Click to View Screenshots</summary>
  <img width="3585" height="2140" alt="startscreen" src="https://github.com/user-attachments/assets/46ec1195-e0ca-4e1b-afb0-e558e5f05bc2" />
  <img width="3585" height="2140" alt="rust+md" src="https://github.com/user-attachments/assets/806b5b4b-7e4e-4172-8428-90dcb41115a3" />
  <img width="3585" height="2140" alt="lua" src="https://github.com/user-attachments/assets/4ff3eb5c-b811-4f4b-a8e9-96b2ab26b47d" />
  <img width="3585" height="2140" alt="rust+md+cmp" src="https://github.com/user-attachments/assets/3af8c38d-ccfa-4813-ae39-ce4cd1d9539f" />
  <img width="3585" height="2140" alt="rust+md+lsp" src="https://github.com/user-attachments/assets/b18a29c4-9fcc-4b4b-9b9d-06caf9f98c8d" />
</details>

## Requirements

- [Neovim] 0.12 or newer
- A [Nerd Font] for statusline and diagnostic icons

### External tools

| Tool            | Purpose              | Install Method                                                                                          |
| --------------- | -------------------- | ------------------------------------------------------------------------------------------------------- |
| `git`           | Version control      | `winget install --id Git.Git`                                                                           |
| `fzf`           | Fuzzy finding        | `winget install --id junegunn.fzf`                                                                      |
| `pwsh`          | Default shell        | `winget install --id Microsoft.PowerShell`                                                              |
| `ripgrep`       | Live grep, `:grep`   | `winget install --id BurntSushi.ripgrep.MSVC`                                                           |
| `tree-sitter`   | Parser CLI           | `cargo install --locked tree-sitter-cli`                                                                |
| `asm_lsp`       | Assembly LSP         | `cargo install asm-lsp`                                                                                 |
| `clangd`        | C/C++ LSP            | `winget install --id LLVM.clangd`                                                                       |
| `jsonls`        | JSON LSP             | `npm install -g vscode-langservers-extracted`                                                           |
| `lua_ls`        | Lua LSP              | `winget install --id LuaLS.lua-language-server`                                                         |
| `marksman`      | Markdown LSP         | `winget install --id Artempyanykh.Marksman`                                                             |
| `powershell_es` | PowerShell LSP       | `gh release download --repo PowerShell/PowerShellEditorServices --pattern PowerShellEditorServices.zip` |
| `rust_analyzer` | Rust LSP             | `rustup component add rust-analyzer`                                                                    |
| `taplo`         | TOML LSP             | `cargo install --features lsp --locked taplo-cli`                                                       |
| `yamlls`        | YAML LSP             | `npm install -g yaml-language-server`                                                                   |
| `codelldb`      | Rust debug adapter   | `gh release download --repo vadimcn/codelldb --pattern "*win32-x64.vsix"`                               |

After downloading `codelldb`, install with:

```powershell
Expand-Archive .\codelldb-win32-x64.vsix ~/.local/bin/codelldb -Force
```

After downloading `powershell_es`, install with:

```powershell
Expand-Archive .\PowerShellEditorServices.zip ~/.local/bin/PowerShellEditorServices -Force
```

## Quick start

Clone into your Neovim config directory and launch:

```powershell
# Linux / macOS
git clone https://github.com/freddiehaddad/nvim.git ~/.config/nvim

# Windows (PowerShell)
git clone https://github.com/freddiehaddad/nvim.git $env:LOCALAPPDATA\nvim
```

```powershell
nvim
```

The first launch bootstraps [vim.pack] and installs all plugins automatically.
Use `<leader>pu` to update plugins.

## Plugins

| Plugin                        | Purpose                                                     |
| ----------------------------- | ----------------------------------------------------------- |
| [ferric.nvim]                 | Colorscheme                                                 |
| [nvim-treesitter]             | Syntax highlighting, folds, and indentation                 |
| [nvim-treesitter-textobjects] | Treesitter-aware textobjects, movement, and swap            |
| [nvim-lspconfig]              | LSP server configuration                                    |
| [blink.cmp]                   | Completion with ghost text and signature help               |
| [mini.nvim]                   | Icons, pairs, surround, move, statusline, sessions, starter |
| [fzf-lua]                     | Fuzzy finder powered by fzf                                 |
| [gitsigns.nvim]               | Git signs, hunk navigation, staging, and blame              |
| [nvim-dap]                    | Debug adapter protocol client                               |
| [nvim-dap-view]               | Modern debugging UI                                         |

## Key mappings

Leader is `<Space>`.

### General

| Key             | Action                       |
| --------------- | ---------------------------- |
| `<C-h/j/k/l>`   | Move between windows         |
| `<C-Arrow>`     | Resize windows               |
| `[b` / `]b`     | Previous / next buffer       |
| `<leader>bd`    | Delete buffer                |
| `<leader>pu`    | Update plugins               |
| `<Esc>`         | Clear search highlights      |
| `<C-]>`         | Go to definition (centered)  |
| `<C-o>`         | Jump back (centered)         |
| `gs`            | Jump to any visible location |
| `<leader>u`     | Undo tree                    |

### Diagnostics

| Key            | Action                     |
| -------------- | -------------------------- |
| `]d` / `[d`    | Next / previous diagnostic |
| `]e` / `[e`    | Next / previous error      |
| `]w` / `[w`    | Next / previous warning    |

### Treesitter textobjects (visual + operator-pending)

| Key            | Action                        |
| -------------- | ----------------------------- |
| `af` / `if`    | Around / inner function       |
| `ac` / `ic`    | Around / inner class/struct   |
| `aa` / `ia`    | Around / inner parameter      |
| `al` / `il`    | Around / inner loop           |
| `ai` / `ii`    | Around / inner conditional    |
| `a/` / `i/`    | Around / inner comment        |
| `]f` / `[f`    | Next / previous function      |
| `]c` / `[c`    | Next / previous class/struct  |
| `<leader>xp`   | Swap parameter forward        |
| `<leader>xP`   | Swap parameter backward       |

### LSP (buffer-local, active on attach)

| Key             | Action                      |
| --------------- | --------------------------- |
| `gd`            | Go to definition            |
| `gl`            | Line diagnostics            |
| `<leader>ca`    | Code actions                |
| `<leader>si`    | Implementations             |
| `<leader>sr`    | References                  |
| `<leader>ss`    | Document symbols            |
| `<leader>sS`    | Workspace symbols           |
| `<leader>st`    | Type definitions            |
| `<leader>th`    | Toggle inlay hints          |
| `<leader>df`    | Format document / selection |

### Fuzzy finder (fzf-lua)

| Key             | Action                     |
| --------------- | -------------------------- |
| `<leader>fb`    | Buffers                    |
| `<leader>fc`    | Config files               |
| `<leader>ff`    | Find files                 |
| `<leader>fF`    | Find files (hidden)        |
| `<leader>fg`    | Git files                  |
| `<leader>fp`    | Pickers (meta)             |
| `<leader>fr`    | Recent files               |
| `<leader>sb`    | Buffer search (fuzzy)      |
| `<leader>sB`    | Buffer search (regex)      |
| `<leader>sd`    | Document diagnostics       |
| `<leader>sD`    | Workspace diagnostics      |
| `<leader>sg`    | Live grep                  |
| `<leader>sG`    | Live grep with glob filter |
| `<leader>sh`    | Help pages                 |
| `<leader>sk`    | Keymaps                    |
| `<leader>sR`    | Resume last picker         |
| `<leader>sw`    | Grep word under cursor     |
| `<leader>s/`    | Search history             |
| `<leader>s"`    | Registers                  |

### Git (fzf-lua)

| Key             | Action                   |
| --------------- | ------------------------ |
| `<leader>gb`    | Branches                 |
| `<leader>gc`    | Commits                  |
| `<leader>gC`    | Buffer commits           |
| `<leader>gs`    | Status                   |
| `<leader>gt`    | Stash                    |

### Git (gitsigns, buffer-local)

| Key             | Action                   |
| --------------- | ------------------------ |
| `]h` / `[h`     | Next / previous hunk     |
| `]H` / `[H`     | Last / first hunk        |
| `ghs`           | Stage hunk               |
| `ghr`           | Reset hunk               |
| `ghS`           | Stage buffer             |
| `ghu`           | Undo stage hunk          |
| `ghR`           | Reset buffer             |
| `ghp`           | Preview hunk inline      |
| `ghb`           | Blame line               |
| `ghB`           | Blame buffer             |
| `ghd`           | Diff unstaged            |
| `ghD`           | Diff against last commit |
| `<leader>tb`    | Toggle blame line        |
| `<leader>tD`    | Toggle show deleted      |

### Completion (blink.cmp, insert mode)

| Key          | Action                       |
| ------------ | ---------------------------- |
| `<C-k>`      | Show / toggle documentation  |
| `<C-s>`      | Show / toggle signature help |
| `<C-e>`      | Toggle completion menu       |

### Debugging (Rust buffers only)

| Key             | Action                   |
| --------------- | ------------------------ |
| `<leader>dc`    | Continue / start         |
| `<leader>dC`    | Run to cursor            |
| `<leader>dn`    | Step over                |
| `<leader>ds`    | Step into                |
| `<leader>do`    | Step out                 |
| `<leader>db`    | Toggle breakpoint        |
| `<leader>dB`    | Conditional breakpoint   |
| `<leader>dt`    | Debug test under cursor  |
| `<leader>dr`    | Toggle REPL              |
| `<leader>dq`    | Terminate session        |
| `<leader>dv`    | Toggle debug view        |
| `<leader>dX`    | Clear breakpoints        |

> Pressing `<leader>dc` auto-builds the project and presents launch
> configurations. `.vscode/launch.json` files are loaded automatically if
> present. `<leader>dt` detects the test function under the cursor via
> treesitter.

## Autocmds

- **Highlight on yank** — briefly highlights yanked text
- **Close with `q`** — help, man, and quickfix buffers close with `q`
- **Auto-reload** — checks for external file changes on focus, buffer enter,
  and cursor idle; notifies when a buffer is reloaded from disk
- **Spell check** — enabled (`en_us`) for `markdown`, `gitcommit`, and `text`
  filetypes; use `]s`/`[s` to navigate misspellings, `z=` for suggestions,
  `zg` to add a word to the personal dictionary
- **Restore cursor** — reopens files at the last edited position (excludes
  gitcommit, gitrebase, help)

## Treesitter parsers

Pre-installed grammars: C, C++, CMake, Git config, Git rebase, Gitattributes,
Gitcommit, Gitignore, HTML, JSON, Lua, Markdown, Regex, RON, Rust, TOML, Vim,
Vimdoc, YAML.

## Project layout

```
init.lua              Editor options, keymaps, autocmds, plugin bootstrap
lua/helpers.lua       Shared keymap helper functions
lua/plugins.lua       Plugin registration, build hooks, and configuration
lua/config/health.lua Healthcheck module (:checkhealth config)
reset.ps1             Helper to wipe plugin data and lock file (Windows)
```

## Healthcheck

Verify that all dependencies are installed:

```vim
:checkhealth config
```

This checks core requirements (Neovim version, git, ripgrep, fzf, pwsh,
tree-sitter), package managers (cargo, npm, gh), LSP servers, the debug
adapter, and plugin status.

## Reset

To start fresh, run the reset script and relaunch Neovim:

```powershell
.\reset.ps1
nvim
```

This removes the vim.pack plugin directory and `nvim-pack-lock.json`.

[Neovim]: https://github.com/neovim/neovim
[vim.pack]: https://neovim.io/doc/user/helptag.html?tag=vim.pack
[ferric.nvim]: https://github.com/freddiehaddad/ferric.nvim
[nvim-treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[nvim-treesitter-textobjects]: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[blink.cmp]: https://github.com/saghen/blink.cmp
[mini.nvim]: https://github.com/nvim-mini/mini.nvim
[fzf-lua]: https://github.com/ibhagwan/fzf-lua
[gitsigns.nvim]: https://github.com/lewis6991/gitsigns.nvim
[nvim-dap]: https://github.com/mfussenegger/nvim-dap
[nvim-dap-view]: https://github.com/igorlfs/nvim-dap-view
[ripgrep]: https://github.com/BurntSushi/ripgrep
[fzf]: https://github.com/junegunn/fzf
[Nerd Font]: https://www.nerdfonts.com/
[`plugins.lua`]: ./lua/plugins.lua
