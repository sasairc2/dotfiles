#compdef btheadset.sh

_btheadset.sh() {
    _arguments -s : \
        '-c[connect device]' \
        '-r[reconnect device]' \
        '-d[disconnect device]' \
        '-q[suppress all output]' \
        '-h[display help and exit]' \
        '-v[output version config and exit]' \
        '-n[manually specify device name]:keyword' \
        '-m[manually specify MAC address]:keyword'
}

_btheadset.sh
