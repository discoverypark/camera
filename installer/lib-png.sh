#!/bin/bash
printf "Running at $@\nInstaller script\nInstalling libpng\n"
if ! command -v wget &> /dev/null; then
	printf "This app requires GNU wget\n"
	exit 1
fi
if ! command -v tar &> /dev/null; then
	printf "This app requires GNU tar"
	exit 1
fi
if ! command -v make &> /dev/null; then
	printf "This app requires GNU make"
	exit 1
fi
cd $@/pkg/tar
printf "HTTP GET http://www.ijg.org/files/jpegsrc.v9d.tar.gz\n"
wget cd $@/pkg/tar
printf "HTTP GET https://github.com/glennrp/libpng/archive/v1.6.35.tar.gz\n"
wget https://github.com/glennrp/libpng/archive/v1.6.35.tar.gz