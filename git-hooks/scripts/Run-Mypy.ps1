Write-Host "Running Mypy checks..."

    Write-Host "Checking Source Files..."
    python -m mypy --strict src
    Write-Host "Checking Test Files..."
    python -m mypy --strict tests

Write-Host "Mypy checks complete. Exit code: $LASTEXITCODE"
Write-Host "--------------------------------------------------------------------------------"

exit $LASTEXITCODE
