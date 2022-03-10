#!/bin/bash
sudo systemctl stop casper-node-launcher
CASPER_VERSION=1_4_4
TRUSTED_HASH=804de698297f35607a55473376080cc576e2187401cee78a126dcc7175bede9f
if [ "$TRUSTED_HASH" != "null" ]; then sudo -u casper sed -i "/trusted_hash =/c\trusted_hash = '$TRUSTED_HASH'" /etc/casper/$CASPER_VERSION/config.toml; fi
sudo logrotate -f /etc/logrotate.d/casper-node
sudo systemctl start casper-node-launcher
