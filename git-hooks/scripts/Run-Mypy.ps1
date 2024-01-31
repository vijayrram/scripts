function Run-Checks ($folder) {
    if (Test-Path $folder) {
        Write-Host "Checking $folder..."
        python -m mypy --strict $folder
        if (-Not $?) {exit $LASTEXITCODE}
    }
}

function Main {
    Write-Host "Running Mypy checks..."

    Run-Checks -folder 'src'
    Run-Checks -folder 'tests'

    Write-Host "Mypy checks complete. Exit code: $LASTEXITCODE"
    Write-Host "--------------------------------------------------------------------------------"

    exit $LASTEXITCODE
}

Main
