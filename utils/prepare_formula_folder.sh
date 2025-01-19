#!/bin/bash

TARGET_DIR="../Formula"

declare -a file_names=("boundary.rb" "consul-aws.rb" "consul-dataplane.rb" "consul-esm.rb" "consul-k8s.rb" "consul.rb" "consul-template.rb" "consul-terraform-sync.rb" "envconsul.rb" "hcdiag.rb" "hc-install.rb" "hcp.rb" "levant.rb" "nomad-pack.rb" "nomad.rb" "packer.rb" "terraform-ls.rb" "terraform.rb" "vagrant.rb" "vault.rb" "waypoint.rb")

rm -f "$TARGET_DIR"/*

for file_name in "${file_names[@]}"; do
    touch "$TARGET_DIR/$file_name"
done
