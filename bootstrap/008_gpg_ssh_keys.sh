#!/bin/bash

bw config server 'https://bitwarden.home'

bw login

# if BW_SESSION *not* set yet
if [ -z "$BW_SESSION" ]; then
    echo "Copy/paste the session key"
    read
    echo "export BW_SESSION=$REPLY" > ~/.bitwarden_session
    source ~/.bitwarden_session
fi

bw sync

mkdir -p ~/.ssh

# fetch_private_key KEY_ID OUTPUT_FILE_NAME
function fetch_ssh_key_pair {
    bw get item "$1" | jq -r '.fields[] | select(.name == "private-key") | .value' | base64 --decode > ~/.ssh/$2
    # ssh-agent cannot import the key if there's
    # no line break at the end
    echo >> ~/.ssh/$2
    chmod u=rw,g=,o= ~/.ssh/$2
    bw get item "$1" | jq -r '.fields[] | select(.name == "public-key") | .value' > ~/.ssh/$2.pub
}

# work 
echo "importing work ssh key"
fetch_ssh_key_pair '90afc785-1039-49da-8d18-9a713304d27d' 'id_work'
# private
echo "importing private ssh key"
fetch_ssh_key_pair 'bf188381-21f5-4daa-b6db-9c64a355e40c' 'id_private'
# home
echo "importing home ssh key"
fetch_ssh_key_pair '874acfe6-52da-4d4b-967c-63fd843f4073' 'id_home'

function fetch_pgp_key_pair {
    bw get item "$1" | jq -r '.fields[] | select(.name == "private-key") | .value' | base64 --decode | gpg --import --
    # ssh-agent cannot import the key if there's
    # no line break at the end
    # echo >> ~/.ssh/$2
    # chmod u=rw,g=,o= ~/.ssh/$2
    # bw get item "$1" | jq -r '.fields[] | select(.name == "public-key") | .value' > ~/.ssh/$2.pub
}

fetch_pgp_key_pair '27f19d55-44cb-4729-8b68-d2a73236e330'