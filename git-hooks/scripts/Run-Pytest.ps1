Write-Host "Running Pytest checks..."

    Write-Host "Running unit tests..."
    python -m coverage run -m pytest
    if ($LASTEXITCODE) {exit $LASTEXITCODE}

    Write-Host "Generating reports..."
    python -m coverage report -m
    python -m coverage xml

Write-Host "Pytest checks complete. Exit code: $LASTEXITCODE"
Write-Host "--------------------------------------------------------------------------------"

exit $LASTEXITCODE
