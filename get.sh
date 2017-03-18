#! /bin/sh

set -e
trap 'test 0 = $? || echo "$0 failed!" >& 2' 0
trap 'exit $?' INT TERM HUP QUIT
host=`hostname`
test -n "$host"
{
	apt-mark showauto | sed 's/^/A /'
	apt-mark showmanual | sed 's/^/M /'
	apt-mark showhold | sed 's/^/= /'
} | LC_COLLATE=C sort -k2 > "$host.txt"
wc -l "$host".txt
