#!/bin/bash

# Get the git global username
username=$(git config --global user.name)

# Get today's date in YYYY-MM-DD format
today=$(date "+%Y-%m-%d")

# Execute the git command and capture the result
result=$(git shortlog --summary --numbered --all --no-merges --author "$username" --before="${today} 23:59" --after="${today} 00:00")

# Echo the result
echo "$result"
