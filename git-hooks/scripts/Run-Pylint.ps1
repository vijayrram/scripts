Write-Host "Running Pylint checks..."

if (Test-Path "src") {
    Write-Host "Checking Source Files..."
    python -m pylint src
    if ($LASTEXITCODE) {exit $LASTEXITCODE}
}

if (Test-Path "tests") {
    Write-Host "Checking Test Files..."
    python -m pylint tests
    if ($LASTEXITCODE) {exit $LASTEXITCODE}
}

Write-Host "Pylint checks complete. Exit code: $LASTEXITCODE"
Write-Host "--------------------------------------------------------------------------------"

exit $LASTEXITCODE
