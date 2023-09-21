#!/usr/bin/env bash
cleantags=$(git tag -l | sed 's/v//')
tag_array=(${cleantags})
echo ${cleantags[]}
