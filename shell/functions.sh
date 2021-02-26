# pretty print a csv file
csv() {
    column -t -s, "$1" | less -S
}
