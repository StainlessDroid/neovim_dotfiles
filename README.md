#  My Neovim Configuration

A minimal yet powerful Neovim setup compatible with 42 sessions.
No need for sudo permissions.

---

## Preview

<img width="2318" height="1980" alt="Screenshot from 2025-11-02 20-40-55" src="https://github.com/user-attachments/assets/85e435b1-2611-4cd5-b40c-592ad2321cd2" />

##  Features

- Fast startup
- Beautiful UI (colorscheme, statusline, etc.)
- Mouse controls and external clipboard support
- code completion and LSP integration
- Treesitter syntax highlighting
- Telescope fuzzy finder

---

## Requirements

- [Neovim](https://neovim.io/) >= 0.12
- [Nerd Font](https://www.nerdfonts.com/) for icons
- [fd](https://github.com/sharkdp/fd) (for Telescope)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for Telescope)

---

## Installation

At 42's clusters you can either compile all dependencies from source and choose a local install or grab the precompiled binaries and add them to your local path.
Once all the dependencies are installed and neovim is working, delete the default config folder created in ~/.config/nvim and replace it with this one:

> git clone https://github.com/StainlessDroid/neovim_dotfiles ~/.config/nvim

## Troubleshooting

The plugin manager will download and install the plugins at startup, but you can do it manually running the :PackerInstall command.
It is recommended to run the :checkhealth <name_of_the_plugin> command for every plugin installed. If anyone throws an error copy the 
