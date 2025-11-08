

# dotfiles

Personal dotfiles managed by Gnu Stow for a modular, reproducible, and portable
development environment.

## Usage

Clone this repository to `~/dotfiles`:

```sh
git clone https://github.com/anthonyoteri/dotfiles ~/dotfiles
```

Change into the `~/dotfiles` directory and create the symlink tree:

```sh
stow .
```

## Adding a New File

Move the file into the `~/dotfiles` folder under the same directory structure as
if the root of the repository were the home folder, then run `stow .` to create a
symlink.

## How It Works

The original files should live under the `~/dotfiles` directory in the same layout
as they would appear in the home directory. Gnu Stow will walk the directory tree
and create symlinks in the parent directory of any files it finds there. For
example, `~/dotfiles/.foobar` will be mapped as a symlink to `~/.foobar`, and
`~/dotfiles/some/path/.barfoo` will be mapped as a symlink to
`~/some/path/.barfoo`.

---

## Managed Configurations

This repository manages configuration for the following tools:

- **Zsh** (`.zshrc`, `.zprofile`, `.profile`): Shell configuration, plugins,
	aliases, and environment variables.
- **Kitty** (`.config/kitty/kitty.conf`): GPU terminal emulator with Gruvbox dark
	theme, powerline separators, and font/padding customizations.
- **Tmux** (`.config/tmux/tmux.conf`): Terminal multiplexer with Gruvbox theme,
	vim-style navigation, mouse support, and plugin management via TPM.
- **Oh My Posh** (`.config/ohmyposh/omp.toml`): Prompt theme for Zsh, with
	multi-line, icons, language versions, and git status.
- **btop** (`.config/btop/btop.conf`): Resource monitor with Gruvbox theme, block
	graphs, mouse and vim key support, and matching font/padding.
- **Topgrade** (`.config/topgrade.toml`): Unified system upgrade tool, configured
	for notifications, cleanup, and parallel upgrades.
- **Neovim** (`.config/nvim/`): Editor configuration, plugins, and custom Lua
	scripts.
- **Zellij** (`.config/zellij/config.kdl`): Terminal workspace manager (if used).

---

## Customization & Extensibility

- All configs are modular and can be extended by adding new files or folders and
	running `stow .`.
- Each tool’s config is documented and tuned for performance, appearance, and
	seamless integration.
- Gruvbox dark theme is used for a consistent look across terminal, prompt, and
	resource monitor.

---

## License

See [LICENSE](LICENSE) for details.

