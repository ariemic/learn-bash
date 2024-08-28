#!/bin/bash

BLOCKED_SITES=(
    # "www.facebook.com"
    # "www.reddit.com"
    # "www.disneyplus.com"
    # "mov2day.to"
    # "www.quora.com"
    "www.youtube.com"
    "www.messenger.com"
    "mail.google.com"
)

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

for site in "${BLOCKED_SITES[@]}"; do
    if grep -q $site /etc/hosts; then
        echo "Unblocking $site..."
        sed -i "/$site/d" /etc/hosts
    else
        echo "$site is already unblocked."
    fi
done

echo "All sites have been unblocked."