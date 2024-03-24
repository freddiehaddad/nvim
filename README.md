# Neovim Configuration

A [Neovim] configuration that's designed to ease customization and
extensibility. Avoid the pitfalls of starting from scratch and fighting with
highly opinionated distributions.

## Screenshots

<details>
<summary>Neovim startup screen:</summary>

![scrn-2023-10-27-16-52-43](https://github.com/freddiehaddad/nvim/assets/6127369/22cbc09e-85a1-413d-8366-0658f3eb1a5b)

</details>

<details>
<summary>Plugin Management via Lazy:</summary>

![20240324-062743](https://github.com/freddiehaddad/nvim/assets/6127369/5e959988-b609-491e-a0bf-70f9dd9326fb)

</details>

<details>
<summary>Tmux Integration:</summary>

![20240324-063942](https://github.com/freddiehaddad/nvim/assets/6127369/ea557495-3f1a-4548-b7c8-c7d4dfde5405)

</details>

<details>
<summary>Integrated Unit Testing:</summary>

![20240324-063942](https://github.com/freddiehaddad/nvim/assets/6127369/0139615c-45fc-4e96-85e5-1d195636297e)

</details>

<details>
<summary>Integrated Debugging:</summary>

![20240324-063850](https://github.com/freddiehaddad/nvim/assets/6127369/e7b17dfd-7378-4618-a52a-f09fd4cb5a6f)

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
- YAML

See the associated lua files in the language directory `lua/plugins/lang` for a
list of required dependencies that must be installed.

## Tmux Support

Seamlessly move and resize tmux and Neovim windows using the same key bindings
(without requiring the prefix key) by adding the following to your tmux
configuration:

```tmux
# function to check if vim is running in the active pane
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

bind-key -T root C-Left if-shell "$is_vim" 'send-keys C-Left' 'resize-pane -L 1'
bind-key -T root C-Down if-shell "$is_vim" 'send-keys C-Down' 'resize-pane -D 1'
bind-key -T root C-Up if-shell "$is_vim" 'send-keys C-Up' 'resize-pane -U 1'
bind-key -T root C-Right if-shell "$is_vim" 'send-keys C-Right' 'resize-pane -R 1'

bind-key -T root C-h if-shell "$is_vim" "send-keys C-h" "if -F '#{==:#{pane_at_left},0}' 'select-pane -L'"
bind-key -T root C-l if-shell "$is_vim" "send-keys C-l" "if -F '#{==:#{pane_at_right},0}' 'select-pane -R'"
bind-key -T root C-j if-shell "$is_vim" "send-keys C-j" "if -F '#{==:#{pane_at_bottom},0}' 'select-pane -D'"
bind-key -T root C-k if-shell "$is_vim" "send-keys C-k" "if -F '#{==:#{pane_at_top},0}' 'select-pane -U'"
```

Synchronize the tmux colorscheme with:

```tmux
# Nightfox Palette

%hidden background="#121821"
%hidden foreground="#cdcecf"

## Normal/regular colors (color palette 0-7)
%hidden black="#393b44"
%hidden red="#c94f6d"
%hidden green="#81b29a"
%hidden yellow="#dbc074"
%hidden blue="#719cd6"
%hidden magenta="#9d79d6"
%hidden cyan="#63cdcf"
%hidden white="#dfdfe0"

## Bright colors (color palette 8-15)
%hidden bblack="#575860"
%hidden bred="#d16983"
%hidden bgreen="#8ebaa4"
%hidden byellow="#e0c989"
%hidden bblue="#86abdc"
%hidden bmagenta="#baa1e2"
%hidden bcyan="#7ad5d6"
%hidden bwhite="#e4e4e5"

%hidden index16="#f4a261"
%hidden index17="#d67ad2"

set -g status-style bg=$background

set -g status-left-length 100
set -g status-left "#[bg=$blue,fg=$background] #{session_name} #[bg=$background,fg=$blue]\
#[fg=$background,bg=$white] \
#{session_path} #[fg=$white,bg=$background] "

set -g status-right-length 100
set -g status-right "#{pane_index} #{pane_id} #[bg=$white,fg=$background]\
#{?pane_in_mode, #{pane_mode} ,}#[bg=$background,fg=$blue]\
#[bg=$blue,fg=$background] #{pane_width}:#{pane_height} "
```

Tmux session creation and navigation is handled by tmux Session Launcher [TSL].

## Organization

```text
$HOME/.config/nvim
├── colortest.sh                -- utility to verify proper color terminal support
├── init.lua
├── lua
│   └── plugins
│       ├── alpha.lua
│       ├── conform.lua
│       ├── dap.lua
│       ├── feline.lua
│       ├── gitsigns.lua
│       ├── icons.lua
│       ├── lang
│       │   ├── bash.lua
│       │   ├── clangd.lua
│       │   ├── go.lua
│       │   ├── json.lua
│       │   ├── lua.lua
│       │   ├── markdown.lua
│       │   └── yaml.lua
│       ├── lspconfig.lua
│       ├── mini.lua
│       ├── neotest.lua
│       ├── nightfox.lua
│       ├── nvimtree.lua
│       ├── oil.lua
│       ├── persistence.lua
│       ├── smartsplits.lua
│       ├── telescope.lua
│       ├── treesitter.lua
│       └── whichkey.lua
├── palette.lua                -- reference file for nightfox palette
├── README.md
└── reset.sh                   -- clear all neovim data and start fresh
```

[neovim]: https://github.com/neovim/neovim
[tsl]: https://github.com/freddiehaddad/tsl
