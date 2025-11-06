#!/bin/sh


if [ $# -ne 2 ]; then
	echo "Enough command-line arguments were not specified. Please provide the following arguments.
	Arg 1: The path to directory on filesystem
	Arg 2: The text string to be found within these files\n"
	exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d $filesdir ]; then
	echo "Argument provided for directory: $filesdir does not exist on the filesystem\n Please provide a proper directory\n"
	exit 1
fi

X=$(find "$filesdir" -type f | wc -l)

Y=$(grep -r $searchstr $filesdir | wc -l)

echo "The number of files are $X and the number of matching lines are $Y"
