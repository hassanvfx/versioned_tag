#!/bin/bash

# Ensure we are in a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Not inside a git repository. Exiting."
    exit 1
fi

# Get tags and sort them using version sort
TAGS=$(git tag | grep -E "^[0-9]+\.[0-9]+\.[0-9]+$" | sort -V)

if [ -z "$TAGS" ]; then
    echo "No valid tags found. Exiting."
    exit 1
fi

echo "Available tags:"
echo "$TAGS"
echo ""

# Get the most recent tag
MOST_RECENT_TAG=$(echo "$TAGS" | tail -n 1)

echo "The most recent tag is $MOST_RECENT_TAG"

# Split the tag into major, minor, patch
IFS='.' read -ra ADDR <<< "$MOST_RECENT_TAG"
MAJOR=${ADDR[0]}
MINOR=${ADDR[1]}
PATCH=${ADDR[2]}

echo ""
echo "Which version would you like to increment?"
echo "a) patch $MAJOR.$MINOR.$((PATCH+1))"
echo "b) minor $MAJOR.$((MINOR+1)).0"
echo "c) major $((MAJOR+1)).0.0"

read -p "Enter your choice (a/b/c): " choice

case $choice in
    a)
        NEW_TAG="$MAJOR.$MINOR.$((PATCH+1))"
        ;;
    b)
        NEW_TAG="$MAJOR.$((MINOR+1)).0"
        ;;
    c)
        NEW_TAG="$((MAJOR+1)).0.0"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

read -p "Are you sure you want to create tag $NEW_TAG? (yes/no): " confirm

if [ "$confirm" == "yes" ]; then
    git tag "$NEW_TAG"
    echo "Tag $NEW_TAG created!"
else
    echo "Tag creation aborted."
fi

