#!/bin/sh

docker run -it --rm --privileged \
	-e RPI_INTERFACE=enx00e04c68059d  \
	-v ${PWD}/rpi:/rpi \
	--network host \
	230e806498c2 \
	/bin/sh
