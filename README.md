# alembic-linear-migrations

This repository provides a [pre-commit hook](https://github.com/pre-commit/pre-commit) designed to enhance the 
development experience when working with [Alembic](https://alembic.sqlalchemy.org/).

The hook generates a file named `versions_hash.txt` in the `alembic` directory. This file contains a hash calculated
from the list of existing migrations. Its purpose is to prevent multiple developers from creating conflicting migrations
based on the same starting revision. Only the first developer's migration will proceed without a Git merge conflict.

When multiple migrations share the same down_revision (i.e., the same starting point), attempting to
run `alembic upgrade head` results in the following error:

```
ERROR [alembic.util.messaging] Multiple head revisions are present for given argument 'head'; please specify a specific 
target revision, '<branchname>@head' to narrow to a specific head, or 'heads' for all heads
```

While using `alembic upgrade heads` resolves this error by applying all migrations, it introduces another problem: at
least one developer would have created their migration without the updated context of prior changes. This can lead to
inconsistencies and unintended behavior.

## Example of versions_hash.txt
```
This file contains the SHA-1 checksum of all *.py files in the alembic/versions directory.
If you encounter merge conflicts with this file, you likely need to verify the down_revision of the migration you are
adding.

See https://github.com/sergio-voxy/alembic-linear-migrations for more details.

71022cd30bc3645bd021df66250cd0fdb90c8e29  -
```


## Installation
Install [pre-commit](https://github.com/pre-commit/pre-commit) and add this to your `.pre-commit-config.yaml`

```yaml
-   repo: https://github.com/sergio-voxy/alembic-linear-migrations
    rev: v0.1.0
    hooks:
    -   id: alembic-linear-migrations
        name: create hash from the list of existing migrations
```

After running this hook, a file called versions_hash.txt will be created in the `alembic` folder.

## Alternatives

If your team consistently creates migrations through a custom script, you can update the script to automatically
generate the revisions_hash.txt file. However, this approach can fail if a developer creates a new migration directly
using Alembic, bypassing the script.

## Credits
Inspired by [django-linear-migrations](https://adamj.eu/tech/2020/12/10/introducing-django-linear-migrations/).

## License
Distributed under the terms of the MIT license, `alembic-linear-migrations` is free and open source software.
