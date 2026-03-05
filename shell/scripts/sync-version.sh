#!/usr/bin/env bash
set -euo pipefail
eval "${SHELLSHOCK_ENVRC:-}"

USAGE="$(cat <<EOF
Syncs the project manifest version fields.

Usage: sync-version.sh <version>

Arguments:
  version         The version to set as latest (must be valid semver).

Flags:
  -h, --help      Show this help text.
EOF
)"

import \
  "$PROJ/shell/.shock/lib/versions.api.sh" \
  "$PROJ/shell/.shock/lib/manifest.api.sh"

function main() {
  local version="$1"

  if ! is_valid_semver "$version"; then
    fatal "Invalid semver: '$version'"
    exit 1
  fi

  manifest_set latest "$version"

  if is_release_version "$version"; then
    manifest_set stable "$version"
  else
    manifest_set stable "$(latest_release_version)"
  fi

  log "Synced manifest to $version"
}

function parse_args() {
  [[ $# -eq 0 ]] && log "$USAGE" && exit 1

  case "$1" in
    -h|--help) log "$USAGE" && exit 0 ;;
    -*) fatal "Unknown option: $1" && log "$USAGE" && exit 1 ;;
  esac

  main "$1"
}

parse_args "$@"
