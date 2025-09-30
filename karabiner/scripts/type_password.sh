#!/bin/bash
# Password typing script for Karabiner-Elements
# Usage: ./type_password.sh password1|password2

PASSWORD_FILE="$HOME/.config/karabiner/passwords.json"
KEY="$1"

if [ -z "$KEY" ]; then
    exit 1
fi

# Read password from JSON file
PASSWORD=$(cat "$PASSWORD_FILE" | grep "\"$KEY\"" | sed 's/.*: *"\(.*\)".*/\1/')

if [ -z "$PASSWORD" ]; then
    exit 1
fi

# Type the password using osascript
osascript -e "tell application \"System Events\" to keystroke \"$PASSWORD\""