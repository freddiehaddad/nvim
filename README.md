# Neovim Configuration

A [Neovim] configuration that's designed to ease customization and
extensibility. Avoid the pitfalls of starting from scratch and fighting with
highly opinionated distributions.

## Palette

![palette](https://github.com/user-attachments/assets/fec53e1f-a0d6-404c-9342-9173e25daf9f)

<https://coolors.co/07090a-101517-1f292d-2a363c-546c78-96938c-707d6d-7c745a-8a9ea0>

## Screenshots

![regular](https://github.com/user-attachments/assets/6fe78062-15d6-4105-bfd7-e16bfd4a1080)

<details>
<summary>Neovim startup screen</summary>

![startup](https://github.com/user-attachments/assets/87683246-a2c5-44f5-8d97-8bb24b0ad7d0)

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

- C
- C++
- JSON
- Lua
- Markdown
- Powershell
- Rust
- YAML

See the associated lua files in the language directory `lua/plugins/lang` for a
list of required dependencies that must be installed.

## Organization

```console
.
├── colors
│   └── peanut.lua
├── init.lua
├── lua
│   ├── peanut
│   │   ├── groups
│   │   │   ├── cmp.lua
│   │   │   ├── dapui.lua
│   │   │   ├── dashboard.lua
│   │   │   ├── git.lua
│   │   │   ├── init.lua
│   │   │   ├── lazy.lua
│   │   │   ├── lsp.lua
│   │   │   ├── markview.lua
│   │   │   ├── mason.lua
│   │   │   ├── neotest.lua
│   │   │   ├── neovim.lua
│   │   │   ├── nvimtree.lua
│   │   │   ├── statusline.lua
│   │   │   ├── telescope.lua
│   │   │   ├── treesitter.lua
│   │   │   └── whichkey.lua
│   │   ├── init.lua
│   │   ├── palette.lua
│   │   ├── settings.lua
│   │   └── util.lua
│   └── plugins
│       ├── blink.lua
│       ├── conform.lua
│       ├── dap.lua
│       ├── feline.lua
│       ├── gitsigns.lua
│       ├── icons.lua
│       ├── lang
│       │   ├── cpp.lua
│       │   ├── json.lua
│       │   ├── lua.lua
│       │   ├── markdown.lua
│       │   ├── powershell.lua
│       │   ├── rust.lua
│       │   └── yaml.lua
│       ├── lspconfig.lua
│       ├── neotest.lua
│       ├── nvimtree.lua
│       ├── persistence.lua
│       ├── snacks.lua
│       ├── telescope.lua
│       ├── treesitter.lua
│       └── whichkey.lua
├── README.md
├── reset.ps1
└── reset.sh
```

[neovim]: https://github.com/neovim/neovim
