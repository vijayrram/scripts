# Script to Setup Python Repositories

Used to setup Git repositories with Run Commands and Git Hooks to run quality control checks through
the development phase in a Python based environment.

## Usage

Run `Setup-Python-Repo.ps1` within a repository.

## Actions

- Creates/Replaces `mypy.ini`
- Creates/Replaces `.pylintrc`
- Creates/Replaces `pytest.ini`
- Adds Git Hooks to `git-hooks`
- Creates/Replaces `Install-Hooks.ps1`
- Installs the hooks present in `git-hooks`

## Git Hooks

Currently the following Git Hooks are enabled.

- [Pre-Commit](#pre-commit)

<a id="pre-commit"></a>
### Pre-Commit

Runs the following quality control checks before committing:

- **Mypy**: Static Type Checking and Linting
- **Pylint**: Static Code Analysis and Linting
- **Coverage**: Code Coverage using Tests
    - **Pytest**: Unit Testing
