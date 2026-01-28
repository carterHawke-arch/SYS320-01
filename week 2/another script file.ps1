cd $PSScriptRoot

. (Join-Path $PSScriptRoot '.\Functions and Event Logs.ps1')

$loginoutsTable = GetLoginouts 15
$loginoutsTable

$downtable = GetShutdown 25
$downtable

$uptable = GetStartup 25
$uptable