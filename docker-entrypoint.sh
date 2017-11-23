#!/bin/sh
#set -x

Xorg -noreset +extension GLX +extension RANDR +extension RENDER -logfile ./xdummy.log -config ./xorg.conf &

if [ $@ ]; then
    exec $@
fi
