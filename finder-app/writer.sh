#!/bin/sh

if [ $# -ne 2 ]; then
	echo "Enough command-line arguments were not specified. Please provide the following arguments.
	Arg 1: A full path to file, including filename, on the filesystem
	Arg 2: The text string to be written to the above file"
	exit 1
fi

writefile=$1
writestr=$2
writefiledir=$(dirname $writefile)


if [ -e $writefile ]; then
	echo "Destination file: $writefile - already exists. overriding the existing file"
elif [ ! -d $writefiledir ]; then
	echo "Creating parent directory: $writefiledir ..."
	mkdir -p $writefiledir
fi

echo "Writing $writestr to $writefile"

echo $writestr > $writefile
