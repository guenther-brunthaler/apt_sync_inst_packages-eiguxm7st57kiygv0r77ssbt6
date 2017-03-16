#! /bin/sh

set -e
trap 'test 0 = $? || echo "$0 failed!" >& 2' 0
trap 'exit $?' INT TERM HUP QUIT
host=`hostname`
test -n "$host"
mkdir -p -- "$host"
dpkg --get-selections > "$host"/installed.txt
apt-mark showauto > "$host"/auto.txt
apt-mark showmanual > "$host"/manual.txt
apt-mark showhold > "$host"/hold.txt
