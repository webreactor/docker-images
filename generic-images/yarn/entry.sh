#!/bin/bash

if [[ "$1" == "" ]]; then
    echo "No command to run"
    exit 1
fi

if [ -n "$ASUSER" ]; then

    HGID=$(echo $ASUSER | cut -f1 -d:)
    HUID=$(echo $ASUSER | cut -f2 -d:)

    getent passwd $HGID > /dev/null
    if  [ $? -ne 0 ]; then
        addgroup --gid $HGID user > /dev/null
    fi

    getent passwd $HUID > /dev/null
    if  [ $? -ne 0 ]; then
        useradd --uid $HUID --gid $HGID -d /tmp user > /dev/null
    fi

    sudo -H -u \#$HUID "$@"

else
    exec "$@"
fi
