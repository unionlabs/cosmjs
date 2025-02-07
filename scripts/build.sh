#!/usr/bin/env bash

set -eou pipefail

# build @unionlabs/amino (@cosmjs/amino)
bun --filter='@cosmjs/crypto' run build
bun --filter='@unionlabs/amino' run build

# build @unionlabs/tendermint-rpc (@cosmjs/tendermint-rpc)
bun --filter='@cosmjs/json-rpc' run build
bun --filter='@cosmjs/socket' run build
bun --filter='@unionlabs/tendermint-rpc' run build
