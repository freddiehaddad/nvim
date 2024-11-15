# Neovim Configuration

A [Neovim] configuration that's designed to ease customization and
extensibility. Avoid the pitfalls of starting from scratch and fighting with
highly opinionated distributions.

## Palette

![Palette](./screenshots/palette.png)

https://coolors.co/07090a-151e1d-111817-3b4853-556778-96938c-707d6d-7c745a-8a9ea0

## Screenshots

![Regular](./screenshots/regular.png)

<details>
<summary>Neovim startup screen</summary>

![Dashboard](./screenshots/dashboard.png)

</details>

<details>
<summary>Markdown Preview</summary>

![Markdown](./screenshots/markdown.png)

</details>

<details>
<summary>Telescope Integration</summary>

![Telescope](./screenshots/telescope.png)

</details>

<details>
<summary>Unit Testing</summary>

![Unit Testing](./screenshots/unit_testing.png)

</details>

<details>
<summary>Debugging</summary>

![Debugging](./screenshots/debugging.png)

</details>

<details>
<summary>Customized Status Bar</summary>

![Active](./screenshots/statusbar_active.png)
![Inactive](./screenshots/statusbar_inactive.png)

</details>

<details>
<summary>File Explorer</summary>

![Explorer](./screenshots/explorer.png)

</details>

<details>
<summary>Whichkey</summary>

![Explorer](./screenshots/whichkey.png)

</details>

<details>
<summary>Plugin Management</summary>

![Lazy](./screenshots/lazy.png)

</details>

<details>
<summary>Integrated LSP/DAP Management</summary>

![Mason](./screenshots/mason.png)

</details>

## Language Support (LSP)

Support for the following languages are included along with (where applicable)
debugging and unit testing functionality from within Neovim.

- Bash
- C
- C++
- Go
- JSON
- Lua
- Markdown
- Rust
- YAML

See the associated lua files in the language directory `lua/plugins/lang` for a
list of required dependencies that must be installed.

## Organization

```console
o- colors
|  o- peanut.lua
o- init.lua
o- lua
|  o- peanut
|  |  o- groups
|  |  |  o- alpha.lua
|  |  |  o- cmp.lua
|  |  |  o- dapui.lua
|  |  |  o- git.lua
|  |  |  o- highlights.lua
|  |  |  o- init.lua
|  |  |  o- lazy.lua
|  |  |  o- lsp.lua
|  |  |  o- markview.lua
|  |  |  o- mason.lua
|  |  |  o- neotest.lua
|  |  |  o- nvimtree.lua
|  |  |  o- statusline.lua
|  |  |  o- telescope.lua
|  |  |  o- treesitter.lua
|  |  |  o- whichkey.lua
|  |  o- init.lua
|  |  o- palette.lua
|  |  o- settings.lua
|  |  o- util.lua
|  o- plugins
|     o- alpha.lua
|     o- cmp.lua
|     o- conform.lua
|     o- dap.lua
|     o- feline.lua
|     o- gitsigns.lua
|     o- icons.lua
|     o- lang
|     |  o- bash.lua
|     |  o- cpp.lua
|     |  o- go.lua
|     |  o- json.lua
|     |  o- lua.lua
|     |  o- markdown.lua
|     |  o- powershell.lua
|     |  o- rust.lua
|     |  o- yaml.lua
|     o- lspconfig.lua
|     o- mini.lua
|     o- neotest.lua
|     o- nvimtree.lua
|     o- oil.lua
|     o- persistence.lua
|     o- telescope.lua
|     o- treesitter.lua
|     o- whichkey.lua
o- palette.html
o- README.md
o- reset.sh
o- reset.ps1
o- screenshots
   o- dashboard.png
   o- debugging.png
   o- explorer.png
   o- lazy.png
   o- markdown.png
   o- mason.png
   o- palette.png
   o- regular.png
   o- statusbar_active.png
   o- statusbar_inactive.png
   o- telescope.png
   o- unit_testing.png
   o- whichkey.png
```

[neovim]: https://github.com/neovim/neovim
