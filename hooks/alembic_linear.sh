#!/bin/sh

readonly VERSIONS_PATH="alembic/versions"
readonly OUTPUT_FILE="alembic/versions_hash.txt"

readonly INTRO_MSG="This file contains the sha1sum of the *.py files in the $VERSIONS_PATH directory.
If you have merge conflicts on this file you probably have to check the down revision
of the migration you are trying to add.

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