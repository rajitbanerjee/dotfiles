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

# TCP ports in use
ports() {
	netstat -Watnlv | grep LISTEN | awk '{"ps -o comm= -p " $9 | getline procname;colred="\033[01;31m";colclr="\033[0m"; print colred "proto: " colclr $1 colred " | addr.port: " colclr $4 colred " | pid: " colclr $9 colred " | name: " colclr procname;  }' | column -t -s "|"
}

# git rebase
grb() {
    git rebase -i "HEAD~$1"
}
