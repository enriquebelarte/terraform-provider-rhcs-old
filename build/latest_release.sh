#!/usr/bin/env bash
# Get all the tags in the repository
tags=$(git tag)

# Split the tags into an array
tag_array=(${tags})

# Initialize the biggest tag
biggest_tag=0

# Iterate over the tags and find the biggest one
for tag in "${tag_array[@]}"; do
  # Split the tag into its components (X and Y)
  x=${tag:1:1}
  y=${tag:2:1}

  echo "TAG: $x$y"
  # If the tag is bigger than the current biggest tag, update the biggest tag
  #if [[ "$x$y" -gt "$biggest_tag" ]]; then
  #  biggest_tag="$x$y"
  #fi
done

# Print the biggest tag
echo "The biggest tag is v$biggest_tag"
