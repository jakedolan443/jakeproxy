#!/bin/bash

SOURCE_PATH="./jakeproxy"  # Path to the source file
BIN_PATH="/usr/local/bin"         # Target path for installation
DEST_PATH="$BIN_PATH/$PROGRAM_NAME" # Destination path

print_error() {
    echo "Error: $1" >&2
}

if [ ! -f "$SOURCE_PATH" ]; then
    print_error "Source file $SOURCE_PATH does not exist."
    exit 1
fi

if [ ! -d "$BIN_PATH" ]; then
    print_error "Destination directory $BIN_PATH does not exist."
    exit 1
fi

cp "$SOURCE_PATH" "$DEST_PATH"

if [ $? -ne 0 ]; then
    print_error "Failed to copy $SOURCE_PATH to $DEST_PATH."
    exit 1
fi

chmod +x "$DEST_PATH"

echo "Installation successful, jakeproxy is now available at $DEST_PATH."
exit 0
