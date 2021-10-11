# dotfiles
Aliases, functions, and other useful setup features for the workstation.

## Getting started
Clone the repo with the following command in order to clone the submodules:

```bash
git clone --recurse-submodules <repo>
```

Next, install the list of programs by running the `install.sh` script as sudo.

After installing necessary packages, you'll need to set up symlinks using the `stow` application.
Assuming you run `stow` from `/home/kbravh/dotfiles`, `stow` will symlink to the parent directory
`/home/kbravh`. This can be overridden using some of the `stow` options (check `man`!). Just run 
`stow` and pass the directories you want to link: 

```bash
stow base git neovim
```

