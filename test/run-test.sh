#! /bin/sh

rm -rf report.txt
satysfi --text-mode "text" main.test.saty -o report.txt

if [ -e report.txt ]; then
	cat report.txt
	cat report.txt | grep "0 fail" > /dev/null
else
	exit 1
fi
