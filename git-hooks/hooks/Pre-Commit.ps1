./git-hooks/scripts/Run-Mypy.ps1
if ($LASTEXITCODE) {exit $LASTEXITCODE}

./git-hooks/scripts/Run-Pylint.ps1
if ($LASTEXITCODE) {exit $LASTEXITCODE}

./git-hooks/scripts/Run-Pytest.ps1
if ($LASTEXITCODE) {exit $LASTEXITCODE}
