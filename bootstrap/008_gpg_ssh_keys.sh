#!/bin/bash

bw config server 'https://bitwarden.home'

bw login

if [ -z "$BW_SESSION" ]; then
    echo "Copy/paste the session key"
    read
    echo "export BW_SESSION=$REPLY" > ~/.bitwarden_session
    source ~/.bitwarden_session
fi

bw sync

mkdir -p ~/.ssh

# fetch_private_key KEY_ID OUTPUT_FILE_NAME
function fetch_key_pair {
    bw get item "$1" | jq -r '.fields[] | select(.name == "private-key") | .value' | base64 --decode > ~/.ssh/$2
    echo >> ~/.ssh/$2
    chmod u=rw,g=,o= ~/.ssh/$2
    bw get item "$1" | jq -r '.fields[] | select(.name == "public-key") | .value' > ~/.ssh/$2.pub
}

# work 
fetch_key_pair '90afc785-1039-49da-8d18-9a713304d27d' 'id_work'
# private
fetch_key_pair 'bf188381-21f5-4daa-b6db-9c64a355e40c' 'id_private'
# home
fetch_key_pair '874acfe6-52da-4d4b-967c-63fd843f4073' 'id_home'
