#!/usr/bin/env bash

export NIX_PATH="nixos-config=/home/wolf/nixos/configuration.nix"
nixos-rebuild switch
