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

Setup-Gitignore
Setup-Mypy
Setup-Pylintrc
