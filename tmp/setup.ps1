write-host "-----------TRY COPYING SYNTAXES-----------"
Write-Host "DLS BIN  : $PSScriptRoot"
write-host "USERNAME : $((Get-LocalUser)[((Get-LocalUser).count)-1])"
write-host "'$PSScriptRoot/dls.vscode' to 'C:\\Users\\$((Get-LocalUser)[((Get-LocalUser).count)-1])\\.vscode\\extensions'"
Copy "$PSScriptRoot/dls.vscode" "C:\\Users\\$((Get-LocalUser)[((Get-LocalUser).count)-1])\\.vscode\\extensions" -Force -Recurse -PassThru
Pause