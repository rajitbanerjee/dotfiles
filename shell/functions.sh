# pretty print a csv file
csv() {
    column -t -s, "$1" | less -S
}

# force set hostname (to prevent network from setting it)
sethost() {
    sudo scutil --set HostName "$1"
}
