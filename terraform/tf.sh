#!/usr/bin/env bash
set -Eeuo pipefail

# Because terraform outputs a lot of lines, we use colors to make our messages more visible
BLUE='\033[34m'
NC='\033[0m' # reset/no color


blue_msg() {
  printf "\n${BLUE}%s${NC}\n\n" "$1"
}

folders=(iam network storage compute)

apply() {
  for f in "${folders[@]}"; do
    blue_msg "### Start applying $f ###"
    terraform -chdir="dev/$f" init -upgrade
    terraform -chdir="dev/$f" apply -auto-approve
  done
}

destroy() {
  # Destroy in reverse dependency order
  for (( i=${#folders[@]}-1; i>=0; i-- )); do
    f="${folders[$i]}"
    blue_msg "### Start destroying $f ###"
    terraform -chdir="dev/$f" destroy -auto-approve
  done
}

case "${1:-apply}" in
  apply)
    apply
    ;;
  destroy)
    destroy
    ;;
  *)
    echo "Usage: $0 [apply|destroy]" >&2
    exit 1
    ;;
esac
