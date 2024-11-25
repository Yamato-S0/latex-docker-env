#!/bin/bash

# Ensure a .tex file is provided
if [ -z "$1" ]; then
    echo "Error: No .tex file specified."
    echo "Usage: latex-env build <file.tex>"
    exit 1
fi

TEX_FILE=$1
FILE_DIR=$(dirname "$(realpath "$TEX_FILE")")
FILE_NAME=$(basename "$TEX_FILE")

# Define the output directory
OUT_DIR="$FILE_DIR/out"

# Create the output directory if it doesn't exist
if [ ! -d "$OUT_DIR" ]; then
    mkdir -p "$OUT_DIR"
    echo "Created output directory: $OUT_DIR"
fi

# Run the Docker container to build the file
docker run --rm \
    -v "$FILE_DIR:/workspace" \
    -w /workspace \
    latex-docker:latest \
    latexmk -pdf -interaction=nonstopmode -outdir=out "$FILE_NAME"

echo "Build completed: $OUT_DIR/${FILE_NAME%.tex}.pdf"