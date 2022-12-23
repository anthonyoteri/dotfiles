# Personal Dotfiles

Personal Dotfiles
------------------

See: https://www.atlassian.com/git/tutorials/dotfiles for an article explaining how this is managed.


Installation:

1) Clone this repository into a "bare" repository in $HOME/.dotfiles

~~~
git clone --bare https://gitlab.oteri.xyz/anthonyoteri/dotfiles.git $HOME/.dotfiles
~~~

2) Define an alias in the current scope

~~~
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
~~~

3) Checkout the actual content from the bare repository

~~~
config checkout
~~~

Note: The above command may fail with a message about untracked files being overwritten, you must manually handle these conflicts.

4) Set the showUntrackedFiles flag on this specific repository to prevent ALL files from being shown as untracked

~~~
config config --local status.showUntrackedFiles no
~~~

## Post installation tasks

### Configuring NeoVIM

~~~ bash
pacman -S neovim-plug
pip install neovim jade
vim + PlugInstall +PlugClean +gq
~~~

