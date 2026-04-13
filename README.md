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
  <img width="3585" height="2140" alt="md+lua+telescope" src="https://github.com/user-attachments/assets/21b34f03-3012-4eca-919f-547d2a2d26d4" />
</details>

## Requirements

- Neovim 0.12 or newer
- Git
- [ripgrep] (`rg`) for Telescope live grep and `:grep`
- A [Nerd Font] for statusline and diagnostic icons
- PowerShell (`pwsh`) is configured as the default shell on Windows

### External tools

Install these separately:

| Tool            | Language   | Type     | Install Method                                                                                        |
| --------------- | -----------| -------- | ----------------------------------------------------------------------------------------------------- |
| `clangd`        | C/C++      | Server   | winget install --id LLVM.clangd                                                                       |
| `codelldb`      | Rust       | Debugger | gh release download --repo vadimcn/codelldb --pattern "*win32-x64.vsix"                               |
| `jsonls`        | JSON       | Server   | npm install -g vscode-langservers-extracted                                                           |
| `lua_ls`        | Lua        | Server   | winget install --id LuaLS.lua-language-server                                                         |
| `marksman`      | Markdown   | Server   | winget install --id Artempyanykh.Marksman                                                             |
| `powershell_es` | Powershell | Server   | gh release download --repo PowerShell/PowerShellEditorServices --pattern PowerShellEditorServices.zip |
| `rust_analyzer` | Rust       | Server   | rustup component add rust-analyzer                                                                    |
| `taplo-cli`     | TOML       | Server   | cargo install --features lsp --locked taplo-cli                                                       |
| `yamlls`        | YAML       | Server   | npm install -g yaml-language-server                                                                   |

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

| Plugin            | Purpose                                                     |
| ----------------- | ----------------------------------------------------------- |
| [ferric.nvim]     | Colorscheme                                                 |
| [nvim-treesitter] | Syntax highlighting, folds, and indentation                 |
| [nvim-lspconfig]  | LSP server configuration                                    |
| [blink.cmp]       | Completion with ghost text and signature help               |
| [mini.nvim]       | Icons, pairs, surround, move, statusline, sessions, starter |
| [telescope.nvim]  | Fuzzy finder with fzf-native and live grep                  |
| [gitsigns.nvim]   | Git signs, hunk navigation, staging, and blame              |
| [nvim-dap]        | Debug adapter protocol client                               |
| [nvim-dap-view]   | Modern debugging UI                                         |

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

### LSP (buffer-local, active on attach)

| Key             | Action                      |
| --------------- | --------------------------- |
| `gl`            | Line diagnostics            |
| `<leader>ss`    | Document symbols            |
| `<leader>sS`    | Workspace symbols           |
| `<leader>sr`    | References                  |
| `<leader>th`    | Toggle inlay hints          |
| `<leader>df`    | Format document / selection |

### Telescope

| Key             | Action                     |
| --------------- | -------------------------- |
| `<leader>ff`    | Find files                 |
| `<leader>fF`    | Find files (hidden)        |
| `<leader>fg`    | Git files                  |
| `<leader>fb`    | Buffers                    |
| `<leader>fc`    | Config files               |
| `<leader>fr`    | Recent files               |
| `<leader>sg`    | Live grep                  |
| `<leader>sG`    | Live grep with glob filter |
| `<leader>sd`    | Document diagnostics       |
| `<leader>sD`    | Workspace diagnostics      |
| `<leader>sh`    | Help pages                 |
| `<leader>sk`    | Keymaps                    |
| `<leader>sR`    | Resume last picker         |
| `<leader>sw`    | Grep word under cursor     |

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

This checks core requirements (Neovim version, git, ripgrep, pwsh, cmake,
tree-sitter), package managers (cargo, npm, winget, gh), LSP servers, the debug
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
[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[blink.cmp]: https://github.com/saghen/blink.cmp
[mini.nvim]: https://github.com/nvim-mini/mini.nvim
[telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim
[gitsigns.nvim]: https://github.com/lewis6991/gitsigns.nvim
[nvim-dap]: https://github.com/mfussenegger/nvim-dap
[nvim-dap-view]: https://github.com/igorlfs/nvim-dap-view
[ripgrep]: https://github.com/BurntSushi/ripgrep
[Nerd Font]: https://www.nerdfonts.com/
[`plugins.lua`]: ./lua/plugins.lua
