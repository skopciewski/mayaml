#!/usr/bin/env bash
set -eo pipefail
[[ "$TRACE" ]] && set -x

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ACCOUNT_DIR="${CURRENT_DIR}/accounts"

main() {
  local profile_file=$1; shift
  ADDR=$(grep -e "^Delivered-To:" -e "^To:" | sed -e "s/^Delivered-To:\s//" -e "s/^To:\s//" | grep -Eio '\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b')
  for email in $ADDR; do
    account_file="${ACCOUNT_DIR}/${email}"
    if [ -f "$account_file" ]; then
      ln -sf $account_file ${ACCOUNT_DIR}/${profile_file}
      return
    fi
  done
}

[[ "$0" == "$BASH_SOURCE" ]] && main "$@"
