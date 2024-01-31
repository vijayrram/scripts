function Run-Checks ($folder) {
    if (Test-Path $folder) {
        Write-Host "Checking $folder..."
        python -m pylint $folder
        if (-Not $?) {exit $LASTEXITCODE}
    }
}

function Main {
    Write-Host "Running Pylint checks..."

    Run-Checks -folder 'src'
    Run-Checks -folder 'tests'

    Write-Host "Pylint checks complete. Exit code: $LASTEXITCODE"
    Write-Host "--------------------------------------------------------------------------------"

    exit $LASTEXITCODE
}

Main
