# alembic-linear-migrations



This repository contains a [pre-commit hook](https://github.com/pre-commit/pre-commit) to improve the development experience with [Alembic](https://alembic.sqlalchemy.org/).

# Installation
## Using pre-commit-hooks with pre-commit
Install [pre-commit](https://github.com/pre-commit/pre-commit) and add this to your `.pre-commit-config.yaml`

```yaml
-   repo: https://github.com/sergio-voxy/alembic-linear-migrations
    rev: v0.1.0
    hooks:
    -   id: alembic-linear-migrations
        name: create hash from the list of existing migrations
```

After running this hook, a file called versions_hash.txt will be created in the `alembic` folder.

# License
Distributed under the terms of the MIT license, `alembic-linear-migrations` is free and open source software.
