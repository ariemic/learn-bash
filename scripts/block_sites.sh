#!/bin/bash

BLOCKED_SITES=(
    "www.facebook.com"
    "www.reddit.com"
    "www.disneyplus.com"
    "mov2day.to"
    "www.youtube.com"
    "www.messenger.com"
    "www.quora.com"
    "mail.google.com"
)


if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

for site in "${BLOCKED_SITES[@]}";do
    if grep -q $site /etc/hosts; then
        echo "$site is already blocked."
    else
        echo "Blocking $site.."
        echo "127.0.0.1 $site" >> /etc/hosts
    fi
done

echo "All sites have been blocked."