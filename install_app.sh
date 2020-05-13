#!/usr/bin/env bash

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Go
filename=go1.14.2.linux-amd64.tar.gz
curl -O "https://dl.google.com/go/${filename}"
sudo tar -C /usr/local -xzf ${filename}
rm -f ${filename}

