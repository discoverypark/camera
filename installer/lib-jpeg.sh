#!/bin/bash
printf "Running at $@/installer\nInstaller script\nInstalling lib-jpeg\n"
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
wget http://www.ijg.org/files/jpegsrc.v9d.tar.gz &> /dev/null
cd $@/pkg/src
printf "Tar unpack GZIP\n"
tar -xf $@/pkg/tar/jpegsrc.v9d.tar.gz &> /dev/null
pritf "Clean up tar\n"
rm $@/pkg/tar/jpegsrc.v9d.tar.gz
cd jpeg-9d
printf "Running configure script with non-root destination\npgk/build\n"
$@/pkg/src/jpeg-9d/configure --prefix=$@/pkg/build/jpeg
printf "Running GNU Make\n"
make
printf "Testing, if errors appear exit immediately\n3..."
sleep 1
printf "2..."
sleep 1
printf "1..."
sleep 1
printf "Testing..."
make test
printf "If no errors appeared, you should be good.\nInstalling..."
make install || printf "Failed" && exit 1