# Put this in code before running tests

if (Get-Module -Name 'BurntToast') {
    Remove-Module -Name 'BurntToast'
}

Write-Warning 'Running'

Import-Module "$PSScriptRoot/../src/BurntToast.psd1" -Force
