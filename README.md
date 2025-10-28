## tmux-easy-man

Helper script to drive tmux from a guided menu.

### Usage

```bash
./tmux-easy-man.sh
```

### Menu options

1. **Create new tmux session** — prompts for a session name and launches it.
2. **Attach to existing session** — lists current sessions and connects to the one you choose.
3. **List active sessions** — runs `tmux ls` to show all sessions.
4. **Kill session** — terminates a selected session cleanly.
5. **Exit** — closes the helper without touching tmux.

All options work even if you detach (`Ctrl+b`, `d`) and reconnect later with `tmux attach -t <name>`.
