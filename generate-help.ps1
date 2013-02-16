# Copyright 2013, Matthew Velic

# generate-help is a function that will create a basic txt file based on the name of a PowerShell module

param
(
	[string]$module
	,[string]$level = $null
)

Try
{
	$cmdlets = Get-Command | Where-Object {$_.ModuleName -eq $module}
}
Catch
{
	Write-Host "Sorry, we had trouble finding that Module. Please check your spelling and that it exists."
}
Finally
{
	Write-Host $module
	Write-Host $level
	Write-Host $cmdlets
}


$awscmds | ForEach-Object {Get-Help $_.Name -Full} | Out-File .\AWS-Cmdlets-Manual.txt

(Get-Content .\AWS-Cmdlets-Manual.txt) | ForEach-Object {$_ -replace "RELATED LINKS", ""} | Set-Content .\AWS-Cmdlets-Manual.txt

(Get-Content .\AWS-Cmdlets-Manual.txt) | ForEach-Object {$_ -replace " Online version: http://aws.amazon.com/documentation/", ""} | Set-Content .\AWS-Cmdlets-Manual.txt