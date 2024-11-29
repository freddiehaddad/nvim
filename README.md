# Neovim Configuration

A [Neovim] configuration that's designed to ease customization and
extensibility. Avoid the pitfalls of starting from scratch and fighting with
highly opinionated distributions.

## Palette

![palette](https://github.com/user-attachments/assets/fec53e1f-a0d6-404c-9342-9173e25daf9f)

https://coolors.co/07090a-101517-1f292d-2a363c-546c78-96938c-707d6d-7c745a-8a9ea0

## Screenshots

![regular](https://github.com/user-attachments/assets/6fe78062-15d6-4105-bfd7-e16bfd4a1080)

<details>
<summary>Neovim startup screen</summary>

![dashboard](https://github.com/user-attachments/assets/c9bfa473-bcb1-4aa3-8614-25f1c6aa9f1e)

</details>

<details>
<summary>Markdown Preview</summary>

![markdown](https://github.com/user-attachments/assets/52806c06-0697-4f81-8771-60d9a469b5c1)

</details>

<details>
<summary>Telescope Integration</summary>

![telescope](https://github.com/user-attachments/assets/6d294563-80cb-4c97-99e8-14f5537638b1)

</details>

<details>
<summary>Unit Testing</summary>

![unit_testing](https://github.com/user-attachments/assets/cf0b3f83-54e6-438d-8f8b-401652359742)

</details>

<details>
<summary>Debugging</summary>

![debugging](https://github.com/user-attachments/assets/f792c172-f3d4-4ce0-9ac5-a66be2a3cc48)

</details>

<details>
<summary>Customized Status Bar</summary>

![statusbar_active](https://github.com/user-attachments/assets/f2d030ca-dab9-415e-9616-bbd46f6862af)
![statusbar_inactive](https://github.com/user-attachments/assets/adacfa9f-e753-4808-b2e8-e3ff162eb236)

</details>

<details>
<summary>File Explorer</summary>

![explorer](https://github.com/user-attachments/assets/581e0ffd-8e2c-41f5-bafb-f5d13dbf8cff)

</details>

<details>
<summary>Whichkey</summary>

![whichkey](https://github.com/user-attachments/assets/f58d3155-f21a-4da3-b1f0-6cdc5dbd2de6)


</details>

<details>
<summary>Plugin Management</summary>

![lazy](https://github.com/user-attachments/assets/8c552a40-b440-44ec-8975-73330835344b)

</details>

<details>
<summary>Integrated LSP/DAP Management</summary>

![mason](https://github.com/user-attachments/assets/a07aa771-1a36-4020-8b20-583a527934c8)

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
