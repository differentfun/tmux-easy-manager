#!/usr/bin/env bash
set -euo pipefail

if ! command -v tmux >/dev/null 2>&1; then
  printf 'Error: tmux is not installed or not in PATH.\n' >&2
  exit 1
fi

list_sessions() {
  if ! tmux ls 2>/dev/null; then
    printf 'No active tmux sessions.\n'
  fi
}

create_session() {
  read -rp 'Name for the new session: ' session_name
  if [[ -z ${session_name// } ]]; then
    printf 'Invalid name.\n'
    return
  fi
  tmux new -s "$session_name"
}

attach_session() {
  list_sessions
  read -rp 'Session to attach: ' session_name
  if [[ -z ${session_name// } ]]; then
    printf 'Invalid name.\n'
    return
  fi
  tmux attach -t "$session_name"
}

kill_session() {
  list_sessions
  read -rp 'Session to terminate: ' session_name
  if [[ -z ${session_name// } ]]; then
    printf 'Invalid name.\n'
    return
  fi
  tmux kill-session -t "$session_name"
}

while true; do
  cat <<'MENU'
------------------------------
1) Create new tmux session
2) Attach to existing session
3) List active sessions
4) Kill session
5) Exit
------------------------------
MENU

  read -rp 'Select a number: ' choice
  case "${choice:-}" in
    1) create_session ;;
    2) attach_session ;;
    3) list_sessions ;;
    4) kill_session ;;
    5) exit 0 ;;
    *) printf 'Invalid choice.\n' ;;
  esac
done
