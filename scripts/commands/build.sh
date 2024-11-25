#!/bin/bash

# Ensure a .tex file is provided
if [ -z "$1" ]; then
    echo "Error: No .tex file specified."
    echo "Usage: latex-env build [file]"
    exit 1
fi

TEX_FILE=$1

# Get the directory and file name
FILE_DIR=$(dirname "$(realpath "$TEX_FILE")")
FILE_NAME=$(basename "$TEX_FILE")

# Run the Docker container to build the file
docker run --rm \
    -v "$FILE_DIR:/workspace" \
    -w /workspace \
    latex-docker \
    latexmk -pdf -interaction=nonstopmode "$FILE_NAME"

echo "Build completed: $FILE_DIR/${FILE_NAME%.tex}.pdf"