#!/data/data/com.termux/files/usr/bin/bash
# Sinkronisasi config opencode antara repo ini dan lokasi live di device.
# Pemakaian: ./sync.sh pull | push [pesan] | status [--full]
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config/opencode"
AGENTS_SKILLS="$HOME/.agents/skills"
LIVE_LOCAL="$CONFIG_DIR/local.jsonc"   # spesifik per device, TIDAK disinkron

copy_into() { mkdir -p "$2"; cp -a "$1"/. "$2"/; }

do_pull() {
  if [ "${1:-}" = "--prune" ]; then
    rm -rf "$AGENTS_SKILLS" "$CONFIG_DIR/skills" "$CONFIG_DIR/agent"
    echo ">> prune: target live dibersihkan dulu"
  fi
  git -C "$REPO_DIR" pull --ff-only
  copy_into "$REPO_DIR/config" "$CONFIG_DIR"
  copy_into "$REPO_DIR/config/agent" "$CONFIG_DIR/agent"
  copy_into "$REPO_DIR/skills" "$AGENTS_SKILLS"
  copy_into "$REPO_DIR/skills-local" "$CONFIG_DIR/skills"
  echo ">> PULL selesai (local.jsonc tidak disentuh)"
}

do_push() {
  copy_into "$CONFIG_DIR/agent" "$REPO_DIR/config/agent"
  cp -a "$CONFIG_DIR/opencode.jsonc" "$REPO_DIR/config/opencode.jsonc"
  rm -rf "$REPO_DIR/skills";      copy_into "$AGENTS_SKILLS"       "$REPO_DIR/skills"
  rm -rf "$REPO_DIR/skills-local"; copy_into "$CONFIG_DIR/skills"  "$REPO_DIR/skills-local"
  git -C "$REPO_DIR" add -A
  if git -C "$REPO_DIR" diff --cached --quiet; then
    echo ">> Tidak ada perubahan untuk di-push"
  else
    git -C "$REPO_DIR" commit -m "sync: ${1:-update dari $(hostname 2>/dev/null || echo termux)}"
    git -C "$REPO_DIR" push
  fi
  echo ">> PUSH selesai"
}

do_status() {
  git -C "$REPO_DIR" fetch -q origin 2>/dev/null || true
  git -C "$REPO_DIR" status -sb
  echo "-- Beda repo vs live (ringkas):"
  local diffs=0
  for pair in "$REPO_DIR/config/opencode.jsonc:$CONFIG_DIR/opencode.jsonc" \
              "$REPO_DIR/config/agent:$CONFIG_DIR/agent" \
              "$REPO_DIR/skills:$AGENTS_SKILLS" \
              "$REPO_DIR/skills-local:$CONFIG_DIR/skills"; do
    if ! diff -rq "${pair%%:*}" "${pair##*:}" >/dev/null 2>&1; then
      echo "   BERBEDA: ${pair##*:}"
      [ "${1:-}" = "--full" ] && diff -rq "${pair%%:*}" "${pair##*:}" | sed 's/^/     /'
      diffs=1
    fi
  done
  [ "$diffs" = 0 ] && echo "   sinkron penuh"
}

case "${1:-help}" in
  pull)   shift; do_pull "$@" ;;
  push)   shift; do_push "$@" ;;
  status) shift; do_status "$@" ;;
  *) sed -n '2,4p' "$0" ;;
esac
