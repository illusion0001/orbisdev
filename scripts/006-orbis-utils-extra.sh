#!/bin/bash
# Script phase by fjtrujy

## Download the source code.
if test ! -d "orbisdev-utils/.git"; then
	git clone https://github.com/orbisdev/orbisdev-utils && cd orbisdev-utils || exit 1
else
	cd orbisdev-utils &&
		git pull && git fetch origin &&
		git reset --hard origin/master || exit 1
fi

## Determine the maximum number of processes that Make can work with.
PROC_NR=$(getconf _NPROCESSORS_ONLN)

## Build and install.
make --quiet -j $PROC_NR clean || { exit 1; }
make --quiet -j $PROC_NR || { exit 1; }
make --quiet -j $PROC_NR install || { exit 1; }
make --quiet -j $PROC_NR clean || { exit 1; }