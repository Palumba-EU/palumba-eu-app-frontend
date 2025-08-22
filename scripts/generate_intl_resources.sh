#!/bin/zsh
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <zip>"
    exit 1
fi

ZIP_SOURCE="$1"
ZIP_DEST_DIRECTORY=$(dirname "$ZIP_SOURCE")"/tmp"

ARB_DEST_DIR=$(grep 'arb_dir:' pubspec.yaml | awk '{print $2}')

if [ -z "$ARB_DEST_DIR" ]; then
    echo "Error: Could not find 'arb_dir' in pubspec.yaml"
    exit 1
fi

ARB_DEST_DIR=$(cd "$(dirname "$ARB_DEST_DIR")"; pwd)/$(basename "$ARB_DEST_DIR")

# Unzip the file
unzip "$ZIP_SOURCE" -d "$ZIP_DEST_DIRECTORY" > /dev/null

# Rename and move the files to the correct directory
find $ZIP_DEST_DIRECTORY -type f -name "intl_en.arb" | while read file; do
    lang=$(basename $(dirname $(dirname "$file")))
    new_name="intl_${lang}.arb"
    echo "Moving $file to $ARB_DEST_DIR/$new_name"
    mv "$file" "$ARB_DEST_DIR/$new_name"
done

# Create translations
dart run intl_utils:generate

# Clean up
rm -rf "$ZIP_DEST_DIRECTORY"
