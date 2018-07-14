function loopit {
    args="$@"
    while true; do
        $args
        sleep 1
    done
}
