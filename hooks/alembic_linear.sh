#!/bin/sh

readonly VERSIONS_PATH="alembic/versions"
readonly OUTPUT_FILE="alembic/versions_hash.txt"

readonly INTRO_MSG="This file contains the SHA-1 checksum of all *.py files in the $VERSIONS_PATH directory.
If you encounter merge conflicts with this file, you likely need to verify the down_revision of the migration you are
adding.

See https://github.com/sergio-voxy/alembic-linear-migrations for more details.
"

if [ -d "$VERSIONS_PATH" ]; then
    echo "Directory $VERSIONS_PATH exists, calculating sha1sum of existing versions..."

    echo "$INTRO_MSG" > $OUTPUT_FILE
    echo alembic/versions/*.py | sha1sum >> $OUTPUT_FILE
    echo "Done..."
else
    echo "Directory $VERSIONS_PATH does not exist."
fi