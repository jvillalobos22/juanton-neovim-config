# Personal Neovim Configuration

My custom Neovim setup, forked from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and tailored for TypeScript/JavaScript development with a focus on productivity and modern tooling.

## Overview

This configuration is built on top of kickstart.nvim but includes my own customizations and preferred plugins. It's designed to be a complete development environment with LSP support, intelligent autocompletion, file navigation, and Git integration.

## Features

- Modern LSP setup with TypeScript, Tailwind CSS, and Lua support
- AI-powered code completion with Supermaven
- Intelligent autocompletion using blink.cmp
- File navigation with Telescope and nvim-tree
- Git integration with gitsigns and git.nvim
- Catppuccin Mocha color scheme
- Custom statusline with lualine
- Automatic formatting with conform.nvim
- Linting with nvim-lint and eslint_d
- Treesitter for enhanced syntax highlighting
- Project management and session handling

## Installed Plugins

### Core Functionality
- **lazy.nvim** - Fast and modern plugin manager
- **nvim-lspconfig** - LSP configuration with Mason for auto-installation
- **blink.cmp** - Fast and feature-rich autocompletion
- **LuaSnip** - Snippet engine for code snippets
- **nvim-treesitter** - Advanced syntax highlighting and code understanding

### Development Tools
- **conform.nvim** - Code formatting (Prettier, Stylua)
- **nvim-lint** - Asynchronous linting with eslint_d
- **supermaven-nvim** - AI-powered inline code suggestions
- **lspsaga.nvim** - Enhanced LSP UI for diagnostics and definitions
- **nvim-autopairs** - Auto-close brackets and quotes
- **nvim-ts-autotag** - Auto-close and rename HTML/JSX tags

### Navigation & Search
- **telescope.nvim** - Fuzzy finder for files, text, and more
  - telescope-fzf-native - Native FZF sorter for better performance
  - telescope-file-browser - File browser extension
  - telescope-ui-select - Use Telescope for UI selections
- **nvim-tree.lua** - File explorer sidebar
- **project.nvim** - Project management and auto-switching

### Git Integration
- **gitsigns.nvim** - Git decorations and hunk operations
- **git.nvim** - Git blame and repository browsing

### UI & Appearance
- **catppuccin** - Mocha color scheme
- **lualine.nvim** - Customizable statusline
- **bufferline.nvim** - Buffer/tab line with icons
- **which-key.nvim** - Keybinding hints and documentation
- **todo-comments.nvim** - Highlight TODO, FIXME, etc. in comments
- **nvim-web-devicons** - File type icons

### Utilities
- **mini.nvim** - Collection of independent micro-plugins
  - mini.ai - Enhanced text objects
  - mini.surround - Surround text with brackets/quotes
  - mini.statusline - Simple statusline
- **guess-indent.nvim** - Auto-detect indentation settings
- **lazydev.nvim** - Lua development for Neovim config

## Keymaps

For a complete list of custom keybindings and shortcuts, see [KEYMAPS.md](KEYMAPS.md).

Key highlights:
- Leader key: `Space`
- Fuzzy finding with Telescope: `<leader>s` prefix
- LSP operations: `gr` prefix (goto references, rename, etc.)
- File explorer: `<leader>e`
- Git operations: `<leader>g` prefix
- Buffer navigation: `Tab` and `Shift-Tab`

## Installation

### Requirements

This configuration requires:
- Neovim >= 0.10 (latest stable or nightly recommended)
- Git
- A C compiler (gcc, clang, or MSVC)
- [ripgrep](https://github.com/BurntSushi/ripgrep) for Telescope grep functionality
- [fd-find](https://github.com/sharkdp/fd) for faster file searching
- Node.js and npm (for TypeScript LSP and Prettier)
- A [Nerd Font](https://www.nerdfonts.com/) (recommended for icons)

### Setup

1. Backup your existing Neovim configuration if you have one:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. Clone this repository:
   ```bash
   git clone git@github.com:jvillalobos22/juanton-neovim-config.git ~/.config/nvim
   ```

3. Start Neovim:
   ```bash
   nvim
   ```

4. Lazy.nvim will automatically install all plugins on first launch. Mason will also install configured LSP servers and tools.

### Usage

- Run `:checkhealth` to verify your installation
- Use `:Lazy` to manage plugins (update, clean, etc.)
- Use `:Mason` to install additional LSP servers or formatters
- Press `<Space>` (leader key) to see available keybindings via which-key

## Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Main configuration file
├── lua/
│   ├── custom/
│   │   └── plugins.lua     # Custom plugin configurations
│   └── kickstart/
│       └── plugins/        # Additional kickstart plugins
├── KEYMAPS.md              # Keymap documentation
└── README.md               # This file
```


## Customization

This configuration is designed to be easily customizable:

1. **Adding new plugins**: Add them to `lua/custom/plugins.lua`
2. **Modifying settings**: Edit `init.lua` directly
3. **LSP servers**: Configure in `init.lua` under the `servers` table
4. **Keymaps**: Add custom keymaps in `init.lua` or create a separate keymap file

## Credits

This configuration is based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) by TJ DeVries and contributors. It has been customized and extended with additional plugins and personal preferences for TypeScript/JavaScript development.

## Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- [Lazy.nvim Plugin Manager](https://github.com/folke/lazy.nvim)
- [The Only Video You Need to Get Started with Neovim](https://youtu.be/m8C0Cq9Uv9o)

