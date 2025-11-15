#!/bin/bash

# This script cleans up common LaTeX auxiliary files, moves PDFs
# *only* from 'build' directories up one level (overwriting),
# and then removes any directories that are now empty.

# 1. Find and remove all specified auxiliary files
find . -type f \( \
    -name "*.aux" -o \
    -name "*.fdb_latexmk" -o \
    -name "*.fls" -o \
    -name "*.log" -o \
    -name "*.synctex.gz" \
\) -delete


# 2. Find all PDF files *only* in 'build' directories and move them up
# The -path filter matches files inside any directory named 'build'.
# This will OVERWRITE any file in the parent dir with the same name.
find . -type f -path '*/build/*.pdf' -execdir mv {} .. \;

# 3. Find and remove all empty directories
# This runs after everything else, cleaning up newly-emptied folders.
find . -type d -empty -delete