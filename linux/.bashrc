# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export MACOS_PATH="/Users/xxx/mnt-linux"

code() {
    local SPEC_DIR=$(realpath ${1})
    local SUB_SPEC_DIR=${SPEC_DIR/\/root}
    ssh mac "code ${MACOS_PATH}${SUB_SPEC_DIR}"
}
