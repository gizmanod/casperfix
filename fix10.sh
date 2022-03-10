#!/bin/bash
sudo systemctl stop casper-node-launcher
CASPER_VERSION=1_4_4
TRUSTED_HASH=b466bc4c9d73cd44aee1a740cc416bf9d9b25a4a49318384a286830992b77ab0
if [ "$TRUSTED_HASH" != "null" ]; then sudo -u casper sed -i "/trusted_hash =/c\trusted_hash = '$TRUSTED_HASH'" /etc/casper/$CASPER_VERSION/config.toml; fi
sudo logrotate -f /etc/logrotate.d/casper-node
sudo systemctl start casper-node-launcher
