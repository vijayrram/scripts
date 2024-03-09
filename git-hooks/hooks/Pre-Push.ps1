./git-hooks/scripts/Run-Mypy.ps1
if (-Not $?) {exit $LASTEXITCODE}

./git-hooks/scripts/Run-Pylint.ps1
if (-Not $?) {exit $LASTEXITCODE}

./git-hooks/scripts/Run-Coverage.ps1
if (-Not $?) {exit $LASTEXITCODE}
