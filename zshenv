export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"

function exists() {
    command -v "$1" >/dev/null 2>&1
}
