Write-Host "Running Pylint checks..."

    Write-Host "Running unit tests..."
    python -m coverage run -m pytest

    Write-Host "Generating reports..."
    python -m coverage report -m
    python -m coverage xml

Write-Host "Pylint checks complete. Exit code: $LASTEXITCODE"
Write-Host "--------------------------------------------------------------------------------"

exit $LASTEXITCODE
