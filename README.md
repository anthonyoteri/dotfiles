# dotfiles
My Dotfiles managed by Gnu Stow

## Usage:

Clone this repository to ~/dotfiles with the following command:

```sh
git clone https://github.com/anthonyoteri/dotfiles ~/dotfiles

```

Change into the `~/dotfiles` directory and create the symlink tree using

```sh
stow .
```

## Adding a new file.

Move the file into the `~/dotfiles` folder under the same directory structure
as if the root of the repository were the home folder, then run `stow .` to
create a symlink.

## How it works

The original files should live under the `~/dotfiles` directory in the same
layout as they would appear in the home directory.  Gnu Stow will walk the
directory tree, and create symlinks in the parent directory of any files it
finds there.  E.g. `~/dotfiles/.foobar` will be mapped as a symlink to
`~/.foobar`, and `~/dotfiles/some/path/.barfoo` will be mapped as a symlink
to `~/some/path/.barfoo`.

