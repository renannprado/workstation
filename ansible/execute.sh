#!/bin/bash

# test localhost calls (should always work)
ansible localhost -m ping

# --become here will ask root permission
ansible-playbook site.yaml --become --ask-become-pass