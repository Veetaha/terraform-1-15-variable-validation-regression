#!/usr/bin/env bash

set -euo pipefail

# Doesn't fail on 1.14.9, but fails on 1.15.0
version="$1"

curl -LO "https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip"
unzip -o "terraform_${version}_linux_amd64.zip"

rm -rf .terraform

TF_LOG=trace ./terraform init -no-color 2>&1 | tee "terraform-init-${version}.log"
