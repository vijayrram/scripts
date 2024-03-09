function Run-Tests ($module) {
    Write-Host "Running $module..."
    python -m coverage run -m $module $args
    if (-Not $?) {exit $LASTEXITCODE}
}

function Generate-Reports {
    Write-Host "Generating reports..."
    python -m coverage report -m
    python -m coverage xml
}

function Main {
    Write-Host "Calculating Coverage..."

    Run-Tests -module pytest
    Generate-Reports

    Write-Host "Pytest checks complete. Exit code: $LASTEXITCODE"
    Write-Host ("-" * 80)

    exit $LASTEXITCODE
}

Main
