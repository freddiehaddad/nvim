# Neovim Configuration

<https://github.com/user-attachments/assets/51d861a0-b026-4d94-a013-6a277ba6e52f>

Opinionated [Neovim] setup powered by [lazy.nvim], a bespoke `rust_inspired` colorscheme, and a single plugin specification file: [`core.lua`]. The goal is a fast, cohesive editing experience with great defaults for Rust, C-family, web formats, and Markdown out of the box.

## Requirements

- Neovim 0.10 or newer (uses `vim.uv` and the new notification APIs)
- Git (for bootstrapping lazy-loaded plugins)
- `rg` (ripgrep) and `fd` for the Telescope pickers
- PowerShell (`pwsh`) is configured as the default external shell on Windows

Optional but recommended tools:

- `stylua` for Lua formatting (`:Mason` can install it)
- A Nerd Font (statusline, dashboard, and diagnostic icons)

## Quick start

```bash
git clone https://github.com/freddiehaddad/nvim.git ~/.config/nvim
nvim
```

The first launch will bootstrap [lazy.nvim], sync plugins, and install language servers and formatters via Mason. Use `:Mason` to verify managed tooling or `<leader>ua` / related Snacks toggles to explore the UI. When running on a new machine you may also want to install `rg`/`fd` manually.

## Highlights

### UI & workflow

- Custom [rust_inspired] theme with matching highlights for statusline, Telescope, Trouble, Snacks notifications, and the dashboard.
- Snacks dashboard with quick actions, animate/scroll toggles, statuscolumn, and a consistent floating window aesthetic.
- `lualine.nvim` configured for global statusline, macro recorder, LSP health, Git branch/diff, and selection/search counters.
- `mini.icons` provides Nerd Font icons everywhere without pulling in `nvim-web-devicons`.
- `oil.nvim` offers a file explorer in place of netrw, with floating windows and single-border popups.

### Editing experience

- [`blink.cmp`] for completion with ghost text, signature help, and friendly snippets.
- [`conform.nvim`] handles formatting with async fallback to LSP when external formatters aren’t available.
- `mini.pairs`, `which-key.nvim`, and a curated set of keymaps in `init.lua`.
- `persistence.nvim` for session restore, gated behind convenient leader mappings.

### Code intelligence & tooling

- [`mason.nvim`] automatically installs core language servers, formatters, and debuggers (see the table below).
- `nvim-lspconfig` with shared on-attach logic, inlay hints, folding, virtual diagnostics toggles, and Telescope-powered navigation.
- `snacks.nvim` augments diagnostics, rename flows, inlay hints, notifications, and file renames.
- `trouble.nvim` integrates with Telescope for diagnostics, quickfix, and symbol views.
- `gitsigns.nvim` adds hunk navigation, inline previews, and staging/reset flows.

### Testing & debugging

- `nvim-dap` with `nvim-dap-ui` and `mason-nvim-dap` for zero-config debugging.
- `nvim-dap-virtual-text` overlays inline variable state.
- `neotest` (with the Rust adapter) provides test running, summary views, and output panes.

### Rust-first workflow

- [`rustaceanvim`] for Rust tooling, hover actions, code lens refresh, and dedicated keymaps.
- [`crates.nvim`] enhances `Cargo.toml` with completion, upgrades, and semantic hover information.

## Language support

| Language / Format | Treesitter | LSP / Tooling              | Formatter | Extras                 |
| ----------------- | ---------- | -------------------------- | --------- | ---------------------- |
| C / C++           | ✅          | `clangd`                   | `clang-format` | DAP via `codelldb` |
| CMake             | ✅          | `neocmake`                 | built-in   |                        |
| JSON              | ✅          | `jsonls` + SchemaStore     | `jq`       |                        |
| Lua               | ✅          | `lua_ls` + `lazydev`       | `stylua`   | Neovim API annotations |
| Markdown          | ✅          | `marksman`                 | `mdformat` | `markview.nvim`        |
| Rust              | ✅          | `rust-analyzer` (rustaceanvim) | `rustfmt` | `crates.nvim`, DAP  |
| TOML              | ✅          | `taplo`                    | `taplo`    |                        |
| YAML              | ✅          | `yamlls` + SchemaStore     | `yamlfmt`  |                        |

Additional tree-sitter grammars are pre-installed for Git files, regex, HTML, and more to keep highlighting consistent across ancillary formats.

## Key mappings at a glance

- Leader is `<Space>`; local leader is also `<Space>`
- `<leader>o` / `<leader>O` open Oil rooted at the buffer or project
- `<leader>ua`, `<leader>ul`, `<leader>uh`, etc. toggle UI affordances via Snacks
- `<leader>cf` triggers formatting through Conform
- `<leader>tt`, `<leader>tr`, `<leader>td` drive Neotest
- `<leader>d…` namespace is reserved for DAP actions (continue, step, breakpoints)
- `<leader>pl` opens the lazy.nvim manager UI
- Rich LSP navigation (`gd`, `gy`, `gI`, `gr`, etc.) is wired through Telescope

See [`init.lua`] for the full list of defaults and window management helpers.

## Project layout

- `init.lua` – editor options, keymaps, autocmds, and lazy.nvim bootstrapping.
- `lua/plugins/core.lua` – single source of truth for plugins, their options, and shared LSP helpers.
- `colors/rust_inspired.lua` & `lua/rust_inspired` – the custom color palette that unifies UI components.
- `lua/plugins/` – additional plugin modules (automatically imported by lazy).
- `reset.ps1` – helper script for pruning caches on Windows.

## Acknowledgements

Thanks to the authors of the plugins above and to the broader Neovim community for tooling, documentation, and inspiration.

---

Happy hacking! If you spot an issue or have an idea for improvement, feel free to open an issue or PR.

[`core.lua`]: ./lua/plugins/core.lua
[`init.lua`]: ./init.lua
[`blink.cmp`]: https://github.com/saghen/blink.cmp
[`conform.nvim`]: https://github.com/stevearc/conform.nvim
[`mason.nvim`]: https://github.com/williamboman/mason.nvim
[`rustaceanvim`]: https://github.com/mrcjkb/rustaceanvim
[`crates.nvim`]: https://github.com/Saecki/crates.nvim
[lazy.nvim]: https://github.com/folke/lazy.nvim
[neovim]: https://github.com/neovim/neovim
[rust_inspired]: ./colors/rust_inspired.lua
