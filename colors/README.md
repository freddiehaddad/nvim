# Nightingale Theme for Neovim

A beautiful dark colorscheme for Neovim based on the [Nightingale VS Code theme](https://github.com/bfrangi/vscode-nightingale-theme).

## Features

- 🎨 Full support for Treesitter syntax highlighting
- 🔍 LSP semantic token highlights
- 📦 Plugin integration (Telescope, NvimTree, Which-key, Git signs, and more)
- 🌈 Complete ANSI terminal color support
- 💅 Italic and bold font styles for better code readability
- 📝 Markdown support with proper heading hierarchy

## Installation

### Using Vim-Plug

```vim
" In your init.vim or .vimrc
Plug 'path/to/nightingale'

" Then in your config
colorscheme nightingale
```

### Using Packer

```lua
-- In your plugins.lua
use { 'path/to/nightingale' }

-- Then in your init.lua
vim.cmd('colorscheme nightingale')
```

### Using Lazy.nvim

```lua
-- In your plugins configuration
{
  'path/to/nightingale',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd('colorscheme nightingale')
  end,
}
```

### Manual Installation (VimScript version)

1. Copy `nightingale.vim` to your Neovim colors directory:
   - **Linux/macOS**: `~/.config/nvim/colors/nightingale.vim`
   - **Windows**: `%LOCALAPPDATA%\nvim\colors\nightingale.vim`

2. Add to your `init.vim`:
   ```vim
   colorscheme nightingale
   ```

### Manual Installation (Lua version)

1. Create a plugin structure:
   ```
   ~/.config/nvim/lua/nightingale/
   ```

2. Copy `nightingale.lua` to `~/.config/nvim/lua/nightingale/init.lua`

3. Add to your `init.lua`:
   ```lua
   require('nightingale').setup()
   ```

## Color Palette

### Base Colors
- **Background**: `#202020` (editor), `#1a1a1a` (terminal)
- **Foreground**: `#ffffff` (code), `#DCD7BA` (UI)

### ANSI Terminal Colors
- Black: `#1F1F28` / Bright: `#2A2A37`
- Red: `#e14c4c` / Bright: `#FF5D62`
- Green: `#89c471` / Bright: `#aed97a`
- Yellow: `#ffd13b` / Bright: `#E6C384`
- Blue: `#5690ac` / Bright: `#81c0da`
- Magenta: `#957FB8` / Bright: `#D27E99`
- Cyan: `#9CABCA` / Bright: `#A3D4D5`
- White: `#DCD7BA`

### Syntax Colors
- **Functions**: `#85a8da` (sky blue, italic)
- **Types**: `#7cd0bf` (teal)
- **Keywords**: `#569cd6` (blue)
- **Control Flow**: `#a584c0` (purple, italic bold)
- **Strings**: `#98BB6C` (green)
- **Numbers**: `#FF9488` (salmon, italic)
- **Constants**: `#f5a284` (peach)
- **Variables**: `#e8e4ca` (cream)
- **Comments**: `#727169` (gray, italic)
- **Operators**: `#f1c57e` (gold)

## Plugin Support

The theme includes custom highlighting for popular Neovim plugins:

- **Treesitter**: Full semantic highlighting support
- **LSP**: Enhanced LSP semantic tokens
- **Telescope**: Beautiful fuzzy finder UI
- **NvimTree**: File explorer integration
- **Which-key**: Keybinding hints
- **Git Signs**: Version control indicators
- **Indent-blankline**: Indentation guides
- **Diagnostic**: LSP diagnostics (errors, warnings, hints)

## Screenshots

The colorscheme features:
- Dark background with high contrast for readability
- Warm color tones inspired by the Nightingale bird's natural habitat
- Carefully selected colors for different syntax elements
- Support for font styles (italic, bold) to enhance code structure

## Customization

If you want to override specific highlights, you can do so after loading the colorscheme:

### VimScript
```vim
colorscheme nightingale

" Override specific highlights
highlight Comment guifg=#your_color gui=italic
```

### Lua
```lua
require('nightingale').setup()

-- Override specific highlights
vim.api.nvim_set_hl(0, 'Comment', { fg = '#your_color', italic = true })
```

## Requirements

- Neovim 0.8+ (for full Treesitter support)
- A terminal with true color support (24-bit color)
- A font that supports italics (recommended: JetBrains Mono, Fira Code, Cascadia Code)

## Related Themes

This theme is part of a multi-editor theme family:
- **VS Code**: [Nightingale Theme](https://github.com/bfrangi/vscode-nightingale-theme)
- **WezTerm**: Use `nightingale.lua` from this repository
- **Neovim**: This colorscheme

## License

Based on the Nightingale VS Code theme by bfrangi.

## Credits

- Original VS Code theme: [Nightingale](https://github.com/bfrangi/vscode-nightingale-theme) by bfrangi
- Color extraction and Neovim port: Automated conversion from VS Code theme
