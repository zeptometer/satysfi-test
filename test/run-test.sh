#! /bin/sh

satysfi --text-mode "text" main.test.saty -o report.txt
cat report.txt
cat report.txt | grep "0 fail" > /dev/null
