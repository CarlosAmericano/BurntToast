BeforeDiscovery {
	$moduleRoot = (Resolve-Path "$PSScriptRoot\..\..\src").Path
	$allFilesPs1 = Get-ChildItem -Path $moduleRoot -Recurse -Filter "*.ps1" | Where-Object FullName -NotLike "$moduleRoot\tests\*"
	$allFilesHelp = Get-ChildItem -Path $moduleRoot -Recurse -Filter "*.help.txt" | Where-Object FullName -NotLike "$moduleRoot\tests\*"

	. "$PSScriptRoot\FileIntegrity.Exceptions.ps1"
}

BeforeAll {
	function Get-FileEncoding {
	<#
		.SYNOPSIS
			Tests a file for encoding.

		.DESCRIPTION
			Tests a file for encoding.

		.PARAMETER Path
			The file to test
	#>
		[CmdletBinding()]
		Param (
			[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)]
			[Alias('FullName')]
			[string] $Path
		)

		try {
			[byte[]]$byte = Get-Content -AsByteStream -ReadCount 4 -TotalCount 4 -LiteralPath $Path
		} catch {
			[byte[]]$byte = Get-Content -Encoding Byte -ReadCount 4 -TotalCount 4 -Path $Path
		}

		if ($byte[0] -eq 0xef -and $byte[1] -eq 0xbb -and $byte[2] -eq 0xbf) { 'UTF8' }
		elseif ($byte[0] -eq 0xfe -and $byte[1] -eq 0xff) { 'Unicode' }
		elseif ($byte[0] -eq 0 -and $byte[1] -eq 0 -and $byte[2] -eq 0xfe -and $byte[3] -eq 0xff) { 'UTF32' }
		elseif ($byte[0] -eq 0x2b -and $byte[1] -eq 0x2f -and $byte[2] -eq 0x76) { 'UTF7' }
		else { 'Unknown, possible ASCII' }
	}
}

Describe "Verifying integrity of module files" {
	Context "Validating PS1 Script file - <_.Name>" -Foreach $allFilesPs1 {
			BeforeAll {
				$file = $_
				$global:ShortName = $file.Name

				$tokens = $null
				$parseErrors = $null
				$ast = [System.Management.Automation.Language.Parser]::ParseFile($file.FullName, [ref]$tokens, [ref]$parseErrors)
			}

			BeforeEach {
				$name = $file.name
			}

			It "[<_.Name>] Should have UTF8 encoding" {
				Get-FileEncoding -Path $file.FullName | Should -Be 'UTF8'
			}

			It "[<_.Name>] Should have no trailing space" {
				($file | Select-String "\s$" | Where-Object { $_.Line.Trim().Length -gt 0} | Measure-Object).Count | Should -Be 0
			}

			It "[<_.Name>] Should have no syntax errors" {
				$parseErrors | Should -BeNullOrEmpty
			}

					It "[$($Global:ShortName)] Should not use <_>" -TestCases $global:BannedCommands {
						$tokens | Where-Object Text -EQ $_ | Should -BeNullOrEmpty
					}

			It "[<_.Name>] Should not contain aliases" {
				$tokens | Where-Object TokenFlags -eq CommandName | Where-Object { Test-Path "alias:\$($_.Text)" } | Measure-Object | Select-Object -ExpandProperty Count | Should -Be 0
			}

	}

	Context "Validating help.txt help file - <_.Name>" -Foreach $allFilesHelp {
		BeforeAll {
			$file = $_
		}

		It "[<_.Name>] Should have UTF8 encoding" {
			Get-FileEncoding -Path $file.FullName | Should -Be 'UTF8'
		}

		It "[<_.Name>] Should have no trailing space" {
			($file | Select-String "\s$" | Where-Object { $_.Line.Trim().Length -gt 0 } | Measure-Object).Count | Should -Be 0
		}

	}
}
