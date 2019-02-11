function loopit {
    shopt -s expand_aliases
    args="$@"
    while true; do
        $args
        sleep 1
    done
}
