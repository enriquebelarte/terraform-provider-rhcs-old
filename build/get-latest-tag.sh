#!/bin/bash
REL_VER=$(git ls-remote --tags --sort='-v:refname' https://github.com/enriquebelarte/terraform-provider-rhcs | head -n 1 | awk -F/ {'print $3'})
echo $REL_VER
