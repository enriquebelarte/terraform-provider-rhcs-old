#!/usr/bin/env bash

# GitHub repository information
owner="enriquebelarte"
repo="terraform-provider-rhcs"

# Make a request to the GitHub API to get information about the latest release
release_info=$(curl -s "https://api.github.com/repos/$owner/$repo/releases/latest")

# Check if the request was successful
if [[ $? -ne 0 ]]; then
    echo "Failed to fetch release information from GitHub API."
    exit 1
fi

# Parse the release information to get the latest release version
latest_version=$(echo "$release_info" | jq -r '.tag_name')

# Check if a release version was found
if [ -n "$latest_version" ]; then
    echo "Latest release: $latest_version"
else
    echo "No releases found in the repository."
fi
