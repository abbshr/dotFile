config-bash() {
    cat macOS/.bashrc >> ~/.bashrc
}

main() {
    config-bash

    true
}

main