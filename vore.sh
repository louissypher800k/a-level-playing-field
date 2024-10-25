#!/bin/bash

# Replace 'username' with the GitHub username
username="elder-plinius"

# Create a directory for the repositories
mkdir -p "$username-repos"
cd "$username-repos"

# Fetch and clone all public repositories
repos=$(curl -s "https://api.github.com/users/$username/repos?per_page=100" | grep -o 'git@[^"]*')

for repo in $repos; do
    git clone "$repo"
done
