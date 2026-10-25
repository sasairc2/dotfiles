# compdef btheadset.sh

_btheadset.sh() {
    _arguments -s : \
        '-c[connect device]' \
        '-d[disconnect device]' \
        '-r[reconnect device]' \
        '-q[suppress all output]' \
        '-h[display help and exit]' \
        '-v[output version config and exit]'
}

_btheadset.sh
