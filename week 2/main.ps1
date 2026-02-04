. (Join-Path $PSScriptRoot "apacheParse.ps1")
clear

ApacheLogs1 | Where-object { $_.Page -like "*page2.html" -and $_.Referrer -like "*index.html" } | Format-Table -AutoSize