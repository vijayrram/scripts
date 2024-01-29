Write-Host "Running Pylint checks..."

    Write-Host "Checking Source Files..."
    python -m pylint src
    Write-Host "Checking Test Files..."
    python -m pylint tests

Write-Host "Pylint checks complete. Exit code: $LASTEXITCODE"
Write-Host "--------------------------------------------------------------------------------"

exit $LASTEXITCODE
