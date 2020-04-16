function loopit {
    shopt -s expand_aliases
    args="$@"
    while true; do
        $args
        sleep 1
    done
}


is_mac() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        return 1
    else
        return 0
    fi
}

is_linux() {
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        return 1
    else
        return 0
    fi
}

# From https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script
#if [[ "$OSTYPE" == "linux-gnu" ]]; then
#        # ...
#elif [[ "$OSTYPE" == "darwin"* ]]; then
#        # Mac OSX
#elif [[ "$OSTYPE" == "cygwin" ]]; then
#        # POSIX compatibility layer and Linux environment emulation for Windows
#elif [[ "$OSTYPE" == "msys" ]]; then
#        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
#elif [[ "$OSTYPE" == "win32" ]]; then
#        # I'm not sure this can happen.
#elif [[ "$OSTYPE" == "freebsd"* ]]; then
#        # ...
#else
#        # Unknown.
#fi
