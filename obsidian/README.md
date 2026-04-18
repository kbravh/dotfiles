# obsidian

Auto-syncs the Obsidian vault at `~/glass-notes` to its git remote every 5
minutes via a systemd user timer.

## Contents

- `sync-obsidian.sh` — commits local changes, then `git pull --rebase && git push`
- `.config/systemd/user/sync-obsidian.service` — oneshot service wrapping the script
- `.config/systemd/user/sync-obsidian.timer` — fires every 5 minutes

The service expects the script at `~/sync-obsidian.sh`, which `stow` provides.

## Setup on a new machine

Prereq: the vault is already cloned to `~/glass-notes` with a working remote.

```bash
cd ~/dotfiles
stow obsidian
systemctl --user daemon-reload
systemctl --user enable --now sync-obsidian.timer
```

Verify:

```bash
systemctl --user list-timers sync-obsidian.timer
journalctl --user -u sync-obsidian.service -n 20
```

## Alternative: cron

If the host uses cron instead of systemd user units, add this line via
`crontab -e`:

```
*/5 * * * * ~/sync-obsidian.sh
```
