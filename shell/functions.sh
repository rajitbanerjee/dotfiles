# pretty print a csv file
csv() {
    column -t -s, "$1" | less -S
}

# force set hostname (to prevent network from setting it)
sethost() {
    sudo scutil --set HostName "$1"
}

# convert markdown to pdf
mkpdf() {
    filename="$1"
    base="${filename%.*}"
    pandoc -o $base.pdf --pdf-engine=/Library/TeX/texbin/pdflatex $base.md
    echo "File created: $base.pdf"
}

# better diff
diff() {
    command diff -u "$1" "$2" | delta
}
