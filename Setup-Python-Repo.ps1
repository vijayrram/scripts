function Main ($Ssh) {
	$Name = $Ssh.split("/")[-1].replace(".git", "")
	if (Test-Path -Path $Name) {exit -1}

	New-Item -Path $Name -ItemType Directory -ErrorAction Ignore
	cd $Name

	git init

	Setup-Gitignore
	Setup-Mypy
	Setup-Pylint
	Setup-Pytest
	Setup-Githooks

	Write-Output "# $Name" | Out-File -Encoding ASCII README.md
	git add .
	git commit -m "Initial Commit" -n
	git branch -M main
	git remote add origin $Ssh
	git push -u origin main

	git checkout -b develop
	git push -u origin develop
}

function Setup-Gitignore {
	Write-Output '# VS Code' | Out-File -Encoding ASCII .gitignore
	Write-Output '.vscode' | Out-File -Append -Encoding ASCII .gitignore
	Write-Output '' | Out-File -Append -Encoding ASCII .gitignore

	Write-Output '# Virtual Environments' | Out-File -Append -Encoding ASCII .gitignore
	Write-Output '.*venv*' | Out-File -Append -Encoding ASCII .gitignore
	Write-Output '' | Out-File -Append -Encoding ASCII .gitignore

	Write-Output '# Coverage Reports' | Out-File -Append -Encoding ASCII .gitignore
	Write-Output '*coverage*' | Out-File -Append -Encoding ASCII .gitignore
	Write-Output '' | Out-File -Append -Encoding ASCII .gitignore

	Write-Output '# Cache Folders' | Out-File -Append -Encoding ASCII .gitignore
	Write-Output '*cache*' | Out-File -Append -Encoding ASCII .gitignore
}

function Setup-Mypy {
	Write-Output '[mypy]' | Out-File -Encoding ASCII mypy.ini
	$TEXT = 'mypy_path = $MYPY_CONFIG_FILE_DIR/src'
	Write-Output $TEXT | Out-File -Append -Encoding ASCII mypy.ini
}

function Setup-Pylintrc {
	Write-Output '[MASTER]' | Out-File -Encoding ASCII .pylintrc
	$TEXT = 'init-hook = "import sys; sys.path.append(''src'')"'
	Write-Output $TEXT | Out-File -Append -Encoding ASCII .pylintrc
}

function Setup-Pytest {
	Write-Output '[pytest]' | Out-File -Encoding ASCII pytest.ini
	Write-Output 'pythonpath = src' | Out-File -Append -Encoding ASCII pytest.ini
}

function Setup-Githooks {
	$SCRIPTS_PATH = 'C:/Scripts/git-hooks/*'
	New-Item -Path 'git-hooks' -ItemType Directory -ErrorAction Ignore
	Copy-Item $SCRIPTS_PATH './git-hooks' -Recurse -Force

	./git-hooks/Install-Scripts.ps1
}

Main $args
