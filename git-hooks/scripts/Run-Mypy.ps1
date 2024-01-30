Write-Host "Running Mypy checks..."

if (Test-Path "src") {
    Write-Host "Checking Source Files..."
    python -m mypy --strict src
    if ($LASTEXITCODE) {exit $LASTEXITCODE}
}

if (Test-Path "tests") {
    Write-Host "Checking Test Files..."
    python -m mypy --strict tests
    if ($LASTEXITCODE) {exit $LASTEXITCODE}
}

Write-Host "Mypy checks complete. Exit code: $LASTEXITCODE"
Write-Host "--------------------------------------------------------------------------------"

exit $LASTEXITCODE
