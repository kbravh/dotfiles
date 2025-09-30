# dotfiles
Aliases, functions, and other useful setup features for the workstation.

## Getting started
Clone the repo.

If you don't yet have it, install the CLI tool `stow`.

Assuming you run `stow` from `/home/kbravh/dotfiles/stow`, `stow` will symlink to the parent directory
`/home/kbravh`. This can be overridden using some of the `stow` options (check `man`!). Just run 
`stow` and pass the directories you want to link: 

```bash
stow base git neovim
```

