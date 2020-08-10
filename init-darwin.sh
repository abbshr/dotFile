config-bash() {
    cat macOS/.bashrc >> ~/.bashrc
    cat .bashrc_append.sh >> ~/.bashrc
}

main() {
    config-bash

    true
}

main