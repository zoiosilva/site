#!/bin/bash

# Get Lando version.
LANDO_VERSION=$(lando version)

# Update text file with current Lando version.
sed -i "s/^Lando: .*$/Lando: $LANDO_VERSION/" SPECS.md
